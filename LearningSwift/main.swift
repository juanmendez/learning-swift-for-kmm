struct Song {
    var title: String
    var album: String
    var releaseYear: Int
    var genre: String

    func summary() -> String {
        "\(title) is a \(genre) song recorded in \(releaseYear) considered \(album)"
    }

    func map() -> Dictionary<String, String> {
        ["title": title, "album": album, "releaseYear": String(releaseYear), "genre": genre]
    }

    // Swift doesn't come with cloning like Kotlin's data classes and Dart's finalize library
    func copy(
            title: String? = nil,
            directory: String? = nil,
            releaseYear: Int? = nil,
            genre: String? = nil
    ) -> Song {

        // no need for return if having a single line, compared to Kotlin fun name(): String = "hello"
        Song(
                title: title ?? self.title,
                album: directory ?? self.album,
                releaseYear: releaseYear ?? self.releaseYear,
                genre: genre ?? self.genre
        )
    }
}

let songs = [
    Song(
            title: "Welcome to the Jungle",
            album: "Appetite for destruction",
            releaseYear: 1987,
            genre: "Heavy Metal"
    ),
    Song(
            title: "Paradise City",
            album: "Appetite for destruction",
            releaseYear: 1987,
            genre: "Heavy Metal"
    ),
    Song(
            title: "Patience",
            album: "GnR Lies",
            releaseYear: 1989,
            genre: "Heavy Metal"
    ),
    Song(
            title: "the Garden",
            album: "Use Your Illusion 1",
            releaseYear: 1991,
            genre: "Heavy Metal"
    ),
    Song(
            title: "Catcher in the Rye",
            album: "Chinese Democracy",
            releaseYear: 2008,
            genre: "Heavy Metal"
    )
]

func comparedSongs(firstSong: Song, secondSong: Song) -> Bool {
    firstSong.title.uppercased() <= secondSong.title.uppercased()
}

let longSortedSongs = songs.sorted(by: comparedSongs)


// defining each argument is a bit closed to Kotlin
/***
val mediumSortedSongs = songs.sorted(by: { firstSong, secondSong ->
    firstSong.title.uppercased() <= secondSong.title.uppercased()
 })
 */
let mediumSortedSongs = songs.sorted(by: {
    (firstSong: Song, secondSong: Song) -> Bool in
    firstSong.title.uppercased() <= secondSong.title.uppercased()
})


// small references arguments by their index
// $0 is firstSong, and $1 is second song above
let sortedSongs = songs.sorted(by: {
    $0.title.uppercased() <= $1.title.uppercased()
})

print(sortedSongs)


// the closure signature is the same as in Kotlin (Type1, Type2) -> ReturnType
func sayHi(response: (String) -> String) -> String {
    response("hi from Closure to:")
}

// Trailing closures do exactly the same as kotlin which is putting a lambda
// outside a method call
print(sayHi { s in
    "\(s) Juan"
}) // notice we don't use the param name

// answer is just an argument added to see how trailing closures work with it
func greeting(answer: String?, hi: (String, String) -> String, bye: (String) -> String) -> String {
    let sayHi = hi("good morning", "dear friend")
    let sayGoodBy = bye("Good bye, dear friend")

    return "\(sayHi) : \(sayGoodBy)"
}

/**
 here we don't use trailing closures, and within each we are also naming each of its arguments
 */
print(
        greeting(answer: "hello", hi: {
            (string0, string1) in
            "\(string0) \(string1) Jose"
        }, bye: {
            (string0) in
            "\(string0)  Jose"
        })
)

// here we use trailing closures, notice the following closure follows with param name
print(
        greeting(answer: "hello") {
            "\($0) \($1) juan"
        } bye: {
            "\($0) juan"
        }
)

// so if we are naming arguments in a closure and adding `in` then we go with multiple lines like this demo..
let strings = [0, 1, 2, 3, 4].map { (number) -> String in
    var number = number
    var output = ""

    // casting works like it's done in Java
    repeat {
        output = String(number) + output
        number /= 10
    } while number > 0
    return output
}

/**
 Swift allows for functions declared in other functions, similar to Dart and Kotlin.
 Then our inner function can reference variables in the outer scope. Swift is smart enough to handle
 memory management so it will take care of disposing variables we no longer use
 */

func repeatFunction(word: String, times: Int) -> () -> String {
    var wordRepeated = ""

    func doRepeat() -> String {
        // I declared I, but since it is not used, the IDE recommended to use underscore
        // which is also used in Kotlin specially for arguments in a function which are not in use
        for _ in 0..<times {
            wordRepeated += " " + word
        }

        return wordRepeated;
    }

    return doRepeat
}

// this returns an inline declaration of a closure
func repeatClosure(word: String, times: Int) -> () -> String {
    var wordRepeated = ""

    return {
        // I declared I, but since it is not used, the IDE recommended to use underscore
        // which is also used in Kotlin specially for arguments in a function which are not in use
        for _ in 0..<times {
            wordRepeated += " " + word
        }

        return wordRepeated;
    }
}

let doFunction = repeatFunction(word: "Function", times: 5)
print(doFunction())
print(doFunction())
print(doFunction())
print(doFunction())

let doClosure = repeatClosure(word: "Closure", times: 5)
print(doClosure())
print(doClosure())
print(doClosure())
print(doClosure())


var completionHandlers = [() -> Void]()

func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

/**
 when we want to grab a hold of a closure and keep a reference outside a function we need to
 ensure the closure is marked with an escaping annotation, which means let the closure outlive the
 method.
 */

var captureBye: ((String) -> String)?

func outlivedClosure(bye: @escaping (String) -> String) -> String {
    captureBye = bye
    let sayGoodBy = bye("Good bye, dear friend")

    return "\(sayGoodBy)"
}

print(outlivedClosure(bye: { "\($0) Juan" }))

print(captureBye?("Hello dear") ?? "hello")

var customersInLine = ["Alex", "Ewa", "Barry", "Daniella"]


typealias closureString = () -> String

func serve(customer: closureString) {
    print("Now serving \(customer())!")
}

serve(customer: { customersInLine.remove(at: 0) })

func serveWithAutoClosure(_ customer: @autoclosure closureString) {
    print("Now serving \(customer())")
}

serveWithAutoClosure("Pedro")