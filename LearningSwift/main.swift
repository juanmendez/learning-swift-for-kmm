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

// based on the enum type
// if we were to catch by data type then we would use instead `catch is DataTypeError`
do {
    let result = try checkStatus(serverNumber: 2)
} catch ServerError.noConnection {
    print("no connection")
} catch ServerError.serverNotFound {
    print("server not found")
} catch ServerError.authRefused {
    print("not authenticated")
} catch {
    print("the problem is \(error)")
}

// you can omit a do/catch by simply assigning try? before the invocation, so if there is an error the result is nil
let result = try? checkStatus(serverNumber: 3)
print("result is \(result)")


enum ActionError: Error {
    case InsufficientMP, OutOfRange, UnknownError
}

func attackEnemy(mp: Int, distance: Double) throws -> Bool {
    guard mp > 10 else {
        throw ActionError.InsufficientMP
    }

    guard distance < 5.89 else {
        throw ActionError.OutOfRange
    }

    return true
}

do {
    if let attackSuccess = try? attackEnemy(mp: 11, distance: 4) {
        print("Attach success: \(attackSuccess)")
    }
} catch ActionError.InsufficientMP {
    print("insufficient")
} catch ActionError.OutOfRange {
    print("out of range")
}