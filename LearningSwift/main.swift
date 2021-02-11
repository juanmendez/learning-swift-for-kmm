enum ServerError: Error {
    case noConnection, serverNotFound, authRefused, unknown
}

func checkStatus(serverNumber: Int) throws -> String {
    switch serverNumber {
    case 1:
        throw ServerError.noConnection
    case 2:
        throw ServerError.serverNotFound
    case 3:
        throw ServerError.authRefused
    default:
        throw ServerError.unknown
    }

    return "Success!"
}

// very interesting.. how we don't use try/catch, but do(try)/catch
do {
    let result = try checkStatus(serverNumber: 1)
} catch {
    print("the problem is \(error)")
}

// based on the type
do {
    let result = try checkStatus(serverNumber: 2)
} catch ServerError.noConnection{
    print("no connection")
} catch ServerError.serverNotFound{
    print("server not found")
} catch ServerError.authRefused{
    print("not authenticated")
} catch {
    print("the problem is \(error)")
}

// you can omit a do/catch by simply assigning try? before the invocation, so if there is an error the result is nil
let result = try? checkStatus(serverNumber: 3)
print("result is \(result)")