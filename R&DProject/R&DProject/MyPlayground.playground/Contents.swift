import UIKit

var greeting = "Hello, playground"
print_debug(greeting.count) // String total character count

// MARK: - Generic function example
let value1 = 10
let value2 = 20.5

func calculatvalue<T: Numeric>(val: T, val2: T) { // Generic two diff value calculation
    let data = val + val2
    print_debug(data)
}
calculatvalue(val: 10, val2: 10.5)

// MARK: - Diff b/w Array And Set
let setArray: Set = [1,2,3,4,5,5] // No duplicate value and unodred values of collection called Set.
print_debug(setArray)

let array : [Int] = [1,2,3,4,4,5] // It can hold duplicate value and in order value of collection called array
print_debug(array)

let array1111 = [[1,2,3,nil,4,],[5,6,7]]
print_debug("Flam Map === \(array1111.flatMap{$0})")

print_debug("Compact Map === \(array1111.compactMap{$0})")


let char: Character = "l"
let sensitiveCount = greeting.filter { $0 == char }.count // case-sensitive
print_debug("Number of same charecter from string \(sensitiveCount)")

// MARK: - Optional value wnraping
let intVal: Int? = 100
if let valua = intVal {
    print_debug(valua)
}

let arrrrrrr = [1,2,3,5,6,8,10,12,13,14,40,50,55,44,23,35,50]
let fltrt = arrrrrrr.filter { nmbr in
    return nmbr>10 && nmbr < 40
}
print_debug(fltrt)


func useGuardFunc() {
    guard let newVal = intVal else {
        return
    }
    print_debug(newVal)
}
print_debug(useGuardFunc())

// MARK: - Enum Assosiated
enum School { // Normal Enum syntax
    case student
    case teachers
    case classes
}

enum Collage { // Assosiated type Enum syntax
    case student(String)
    case teachers(String)
    case classes(String)
}
print_debug(Collage.teachers("All teachers"))

enum Student : String { // Row value Enum syntax
    case name = "Bhupi"
    case age = "20"
}
print_debug(Student.name.rawValue)

// MARK: - Associated protocol with examples
protocol ADDNumbers {
    associatedtype countValType
   mutating func addItemsNmbrs(_ totalNumbr: countValType)
    func count() -> Int
}

struct intNumber: ADDNumbers {
    typealias countValType = Int
    var items: [Int] = []
    mutating func addItemsNmbrs(_ totalNumbr: Int) {
        items.append(totalNumbr)
    }
    
    func count() -> Int {
        return items.count
    }
}

struct flotValue: ADDNumbers {
    typealias countValType = Float
    var items: [Float] = []
    mutating func addItemsNmbrs(_ totalNumbr: Float) {
        items.append(totalNumbr)
    }
    
    func count() -> Int {
        return items.count
    }
}

var intValue = intNumber()
intValue.addItemsNmbrs(10)
intValue.addItemsNmbrs(15)
print_debug("Int values total count \(intValue.count())")
print_debug("Int values total \(intValue)")

var floatValue = flotValue()
floatValue.addItemsNmbrs(10.5)
floatValue.addItemsNmbrs(20.5)
print_debug("Float values total count \(floatValue)")
print_debug("Float values total \(floatValue)")


// MARK: - Computed Property
struct Users {
    var salary = 2000
    let hra = 100
    let da = 300
    
    var grossSalary: Int {
        get {
            return salary + hra + da
        }
        
        set (newValue) {
            salary = newValue
        }
    }
    
    
}
var userDetails = Users()
print_debug(userDetails.grossSalary)
print_debug(userDetails.salary = 4000)

// 1. Swift - open source lang   1. Objc - !Open source lang
// 2. ,, - easy and clean to read and maniatin , 2. Objc is based on c. So it is hard to use
// 3. easy to understand for time development and length od code , 3. it take 2x time of the swift for the deveopment
// 4. easy and fast to read and write. it reduce the time for development 4. objc is hard to comparision of swift
// 5. swf designed ensure for safty.  4. objc is not safe like sft

/*
// MARK: - SOLID
 S - Single Responsiblity
 O - Open Close Priciple Responsibility
 L - Liskov Subtitution
 I - Interface Segrication
 D - Dependency Inversion
*/

//MARK: - Basic clouser
var message = {
    print_debug("Hello Frnds")
}
message()

//MARK: - Parameter clouser
var message1 = {(msg: String) in
    print_debug("Hello \(msg)")
}
message1("Bhupi")

//MARK: - parameter return clouser
var message2 = {(msg: String) -> (String) in
    return "Hello Return Type \(msg)"
}
print_debug(message2("Bhupi"))

//MARK: - Trailing Clouser
func trailingFunnction(name: String, trlClsr: () -> ()) {
    print_debug("User \(name)")
    trlClsr()
}

trailingFunnction(name: "Bhupi") {
    print_debug("Using for trailing")
}

//MARK: - Auto clouser
func autocloserFunction(name: @autoclosure () -> ()) {
    name()
}
autocloserFunction(name: print_debug(789))

// MARK: - Non Escaping Clouser



// MARK: - Example generic function
calculatvalue(val: 0.005, val2: 10.5)
func calculateValues<T: Numeric>(valeu1: T, value2: T) {
    print_debug(valeu1 + value2)
}

// MARK: - Example for higher order
// 1. Map, 2. Reduce , 3. Filter , 4. Compact map, 5. Flat Map, 7, forEach, 8. Sort, 9. Sorted

// Flat Map
let flatMap  = array.flatMap{$0}
print_debug(flatMap)

// Compact Map
let compactOrder = array1111.compactMap{$0}
print_debug(compactOrder)

// Reduce
let reduce = array.reduce(0,{$0 + $1})
print_debug(reduce)

let reduce1 = array.reduce("",{$0 + String($1)})
print_debug(reduce1)

// MAP
let mapF = array.map{$0}
print_debug(mapF)

// Filter
let filterF = array.filter{$0 % 2 != 0}
print_debug(filterF)

let sortedAF = array.sorted()
print_debug(sortedAF)

let sortedDF = array.sorted { a, b in
    return a > b
}
print_debug(sortedDF)

let filterf2 = array.filter{$0 < 4}
print_debug(filterf2)

let numbersInWord = ["One", "Two", "Three", "Four", "Five", "Six"]

numbersInWord.forEach { element in
    print_debug(element)
}

let setData = Set(array)
print_debug(setData)

var val = 40
inoutUse()
func inoutUse() {
    print_debug(inoutFunction(numbersVal: &val))
}

func inoutFunction(numbersVal: inout Int) {
    numbersVal = 100
}


let basicClsr = {
    print_debug("Dummy Basic Clouser just for testing")
}
basicClsr()

var basicParmClsr = { (name: String) in
    print_debug(name)
}
basicParmClsr("Hello Dummy Param")

var returnDummyPrmClr = { (age: Int) -> (Int) in
    print_debug(age)
    let newAge = age + 50
    return newAge
}

print(returnDummyPrmClr(20))

//  MARK: - URL SESSION USED FOR API INTEGRATIONS
let url: URL = URL(string: "www.google.com")!
let urlSession = URLSession.shared.dataTask(with: url) { data, responnse, error in
    print_debug(responnse)
}
