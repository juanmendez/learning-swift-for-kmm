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

var jungle = Song(
        title: "Welcome to the Jungle",
        album: "Appetite for destruction",
        releaseYear: 1987,
        genre: "Heavy Metal"
)

var patience = Song(
        title: "Patience",
        album: "GnR Lies",
        releaseYear: 1989,
        genre: "Heavy Metal"
)

print("summary \(jungle.summary())")
print("map \(jungle.map())")
print("summary \(patience.summary())")

let map = jungle.map()
let paradiseCity = jungle.copy(title: "Paradise City")
print(paradiseCity)

for valueKey in map {
    print("\(valueKey.key) \(valueKey.value)")
}

// same type like in Kotlin  () -> Bool
/**
 val boolReturn = { map["notFound"] == null }

 assert(boolReturn.invoke())
 */

/**
 Dart
 final boolReturn = () { return map["notFound"] == null };
 assert(boolReturn());
 */
let boolReturn = {
    map["notFound"] == nil
}
assert(boolReturn())

assert({
    map["notFound"] == nil
}())
