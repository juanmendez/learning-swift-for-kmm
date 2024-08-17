import Foundation

struct StringUtils {
    static var EMPTY = ""
}

class DataDog {
    var tag: String
    var issue: String{
        willSet {
           print("setting \(newValue)")
        }
        didSet {
            print("assigned \(oldValue)")
        }
    }
    private var _name: String = StringUtils.EMPTY

    // handling getter and setter
    var name: String {
        get {
            _name
        }
        set {
            _name = newValue
        }
    }
    
    // handling getter.. yes, it is not a let!!!
    var nombre: String {
        _name
    }
    
    
    init(tag: String = StringUtils.EMPTY, issue: String = StringUtils.EMPTY) {
        self.tag = tag
        self.issue = issue
    }
}

class LogInterceptor {
    lazy var dataDog = DataDog()
}

let logInterceptor = LogInterceptor()
logInterceptor.dataDog.issue = "bad issue"
print("my data dog: \(logInterceptor.dataDog.issue)")


@propertyWrapper
struct ArrayWithEvenItems {
    private var evenList: [Int]
    private(set) var projectedValue: Int
    
    
    init(evenList: [Int] = [], projectedValue: Int = 0) {
        self.evenList = evenList
        self.projectedValue = projectedValue
    }
    
    var wrappedValue: [Int] {
        get { return evenList }
        set {
            self.projectedValue += 1
            evenList = newValue.filter { $0 % 2 == 0}
        }
    }
}


struct MyContent {
    @ArrayWithEvenItems static var EVEN_LIST: [Int]
    @ArrayWithEvenItems var evenList: [Int]
    
    static var computedTypeProperty: Int {
        return 1
    }
    
    // a struct is a value type, therefore we cannot modify the instance unless we mark it as a mutating function
    mutating func updateMyList(_ newList: [Int]) {
        evenList = newList
    }
}

print("list has \(MyContent.EVEN_LIST)")
print("list has been reassigned \(MyContent.$EVEN_LIST) times")

MyContent.EVEN_LIST = [1, 2, 3, 4, 5, 6, 7, 8]

print("list has \(MyContent.EVEN_LIST)")
print("list has been reassigned \(MyContent.$EVEN_LIST) times")

var myContent = MyContent()
print("the list is \(myContent.evenList)")
