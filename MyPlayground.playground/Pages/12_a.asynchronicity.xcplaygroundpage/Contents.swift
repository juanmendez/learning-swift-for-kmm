import Foundation
import PlaygroundSupport

func talkAboutMessages() -> AsyncStream<String> {
    return AsyncStream<String> { continuation in
        continuation.yield("a")
        continuation.yield("b")
        continuation.yield("c")
        continuation.yield("d")
    }
}

Task {
    for await message in talkAboutMessages() {
        print("line is \(message)")
    }
}

func getMessages() async -> [String] {
    return ["IMG001", "IMG99", "IMG0404"]
}

func getMessagesWithDelay(seconds: Int = 0)  async throws -> [String] {
    try await Task.sleep(for: .seconds(seconds))
    return ["IMG011", "IMG99", "IMG0404"]
}

Task {
    let messages = await getMessages()
    
    for message in messages {
        print("line is \(message)")
    }

    // lets do several tasks in sequence
    let job1 = await getMessages()
    let job2 = await getMessages()
    let job3 = await getMessages()
    
    let sequencedJobs = [job1, job2, job3]
    print("first sequenced jobs combined \(sequencedJobs)")

    // lets do several tasks in parallel
    async let job4 = getMessages()
    async let job5 = getMessages()
    async let job6 = getMessages()
    
    // then after waiting for all jobs combine them into a list.
    let parallelJobs = await [job4, job5, job6]
    print("second sequenced jobs combined \(parallelJobs)")
}

/**
 The async-let syntax described in the previous section implicitly creates a child task — this syntax works well when you already know what tasks your program needs to run.
 */

/**
 You can also create a task group (an instance of TaskGroup) and explicitly add child tasks to that group, which gives you more control over priority and cancellation, and lets you create a dynamic number of tasks.
 */
Task {
    let allMesssages = await withTaskGroup(of: [String].self) { group in
        for _ in 0..<3 {
            group.addTask {
                await getMessages()
            }
        }
        
        var results: [String] = []
        for await messages in group {
            messages.forEach { results.append($0) }
        }
        
        return results
    }
    
    print("all job messages \(allMesssages)")
}

Task {
    // In Swift, [String].self is used to refer to the type itself rather than an instance of the type.
    // Here, [String] is an array of String elements, and .self is used to get the type object of the array.
    let allMesssages = await withTaskGroup(of: [String].self) { group in
        for i in 0..<3 {
            group.addTask {
                (try? await getMessagesWithDelay(seconds: i)) ?? []
            }
        }
        
        var results: [String] = []
        for await messages in group {
            messages.forEach { results.append($0) }
        }
        
        return results
    }
    
    print("all job messages \(allMesssages)")
}
