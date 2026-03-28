//
//  ViewController.swift
//  R&DProject
//
//  Created by ashish on 15/02/23.
//

import UIKit
import CoreLocation

//https://www.youtube.com/watch?v=zJSrY0jRPao      - higher order functions
class ViewController: UIViewController {
    var optional: Person?
    let numbers = [1,2,3,nil,5,6]
    
    let multidimentionArr = [[1,2,3],[4,5,6],[7,8,9]]
    let numbers2 = [7,4,6,5,2,1,8,10,9]
    var fixValue = 50

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = calculateTwoValue(10, 20)

        
        let user = User()
        user.name = "Bhuupi"
        user.fetchData()
        user.completion?()
        
        arrayLgic()
        
//        var points = "test@gmai.com,test2@gmail.com"
//        var arr11 = points.components(separatedBy: ",")
//        print(arr11)
        
        let arr = numbers2.filter{$0 % 2 == 0}
       // print_debug(arr)
        // Do any additional setup after loading the view.
        /*
         1. deferUse()
         2. UseForTuple()
         3. operaters()
         4. turneryOperators()
         5. optionalAndTypes()
         6. controllStatements()
         7. Singleton.shared.displayData // For create singleton class
         8. forStructAndClassDiff()
         9. higherOrderFunction()
         10. forKvcAndKvoUse()
         11. ClousersDemo()
         12. inOutFunction()
         13. Latest xcode version - 14.3
         14. Latest iOS version - 16.4
         15. Latest swift version- 5.6
         16. View life cycle
         17. App life cycle
         18. Notification life cycle
         19. Git knowledge
         20. Sync/Await
         21. App thinning
         22. Set
         23. initializers()

         */
       // optionalAndTypes()
        
        initializers()
       // ClousersDemo()
    }
  
    
    func calculateTwoValue(_ value1: Int, _ value2: Int) -> Int {
        var calculate = value1 + value2
        return calculate
    }
    
    func arrayLgic() {
        // MARK: - Highest number value
        let arrayCollection = [4,7,99,333,44,2,50,6,8,10, 2, 6 ,8]
        var highest = arrayCollection[0]
        for number in arrayCollection {
            if number > highest {
                highest = number
            }
        }
        print_debug(highest)
        
        // MARK: - Lowest number value
        var lowest = arrayCollection[0]
        for number in arrayCollection {
            if number < lowest {
                lowest = number
            }
        }
        print_debug(lowest)
        
        //        MARK: - Odd Number and Even Number
        var oddNumber: [Int] = []
        var evenNumber: [Int] = []
        
        for number in arrayCollection {
            if number % 2 == 0 {
                evenNumber.append(number)
            } else {
                oddNumber.append(number)
            }
        }
        print_debug(evenNumber)
        print_debug(oddNumber)
        
        //        MARK: - Duplicate number remove
        
        var finalArray: [Int] = []
        for number in arrayCollection {
            if !finalArray.contains(number) {
                finalArray.append(number)
            }
        }
        print_debug(finalArray)
        
        
        //        MARK: - Get Duplicate number
        
        var DuplicateArray: [Int] = []
        var seenArray: [Int] = []
        
        for number in arrayCollection {
            if seenArray.contains(number) {
                if !DuplicateArray.contains(number) {
                    DuplicateArray.append(number)
                }
            } else {
                seenArray.append(number)
            }
        }
        print_debug(seenArray)
        print_debug(DuplicateArray)
    }
    

    // MARK: - Initializer
    func initializers() {
        /* Type of initializer
         1. Swift initializer
         2. Parametised initializer
         3. Initilizer overloading
         All These above inialiser is called "Desinated initializer"
         4.Convenience Initializer
         5. Failable Initializer
         6. Memberwise initializer for struct
         */
        
//        MARK: - Desinated init or Swift initializer
       /*
        let basicInitializer = A()
        print_debug(basicInitializer)
    */
        
//        MARK: - Desinated init or Parametised initializer
        /*
        let designatedInit = A(name: "Bhupi Ji example for Desinated Initializer or parameterised init")
        print_debug(designatedInit.name)
        
       */
//    MARK: - Convenience initializer
       
        let convenience = A()
        print_debug(convenience.name)
       
        
//    MARK: - Failable initializer
      /*
        let failableInit = A(name: "")
        print_debug(failableInit?.name)
       */
    }
    
//    MARK: - Remove duplicate value from array
    func getDuplicateOrUniq(arr: [Int]) -> [Int] {
        var newArr: [Int] = []
        var duplicateVal: [Int] = []
        for x in arr {
            if !newArr.contains(x) {
                newArr.append(x)
            } else {
                duplicateVal.append(x)
            }
        }
        print_debug(duplicateVal)
        return newArr
    }
    
    //    MARK: - Use Defer in swift
    func deferUse() {
        print("Step- 1")
        print("Step- 2")
        defer{
            print("Step- 3")
        }
        print("Step- 4")
        print("Step- 5")
        
        var languages = ["Swift", "Objective-C", "Kotlin", "JavaScript", "Java"]
        func removeLastValue() -> String? {
           let lastValue = languages.last
           defer {
              languages.removeLast()
           }
           return lastValue
        }
        let lastValue = removeLastValue()
        print("last value: \(lastValue ?? "")")
        print("Array: \(languages)")
    }
    
    //    MARK: - Tuple Use
    func UseForTuple() {
        let myTuple = (2,3,5, "Bhupi", 20, 0.70) // A Group of diffrent data type values is called Tupple.
        print(myTuple)
        
        let dictTuple = (length: 30, width: 50)
        print(dictTuple)
        print(dictTuple.length)
        print(dictTuple.width)
    }
    
//    MARK: - Operators Use
    func operaters () {
        //        Combine Operator
        let enteredDoorCode = true
        let passedRetinaScan = false
        
        let hasDoorKey = false
        let knowsOverridePassword = true
        
        if (enteredDoorCode && passedRetinaScan) || knowsOverridePassword {
            print("Access")
        } else {
            print("Access Denied")
        }
    }
    
    func turneryOperators() {
        let contentHeight = 40
        let hasHeader = true
        let rowHeight = contentHeight + (!hasHeader ? 50 : 20)
        print_debug(rowHeight)
    }
    
//    MARK: - Optional topic and defination
    func optionalAndTypes() {
        let address = Address(street: "SBD", state: "UP", city: "Agra", zipCode: 283125)
        optional = Person(firstName: "Bhupi", middleName: "K", lastname: "", address: address)
        // There are four type unwrapping the optional value

        //         1. Force unwrapping
        print_debug("Force unwrapping == \(optional?.middleName!)")
        
        //        2. Nil Coalescing
        print_debug("Nil Coalescing === \(optional?.lastName ?? "Verma")")
        
        //        3.a Optional Binding (if let)
        if let lstName = optional?.lastName {
            print_debug("Optional Binding with use if let === \(lstName)")
        }
        
        //        3.b Optional Binding (guard let)
        guard let lastName = optional?.lastName else { return }
        print_debug("Optional Binding with use guard let === \(lastName)")
        
        if let address = optional?.address {
            if let state = address.state {
                print_debug("if let optinal binding == \(state)")
            }
        }
        
        //        Optional Chaning
        if let city = optional?.address?.city {
            print_debug("Optional Chaining === \(city)")
        }
    }
//    MARK: - Control transfer
    func controllStatements() {
        // Return , Break , Countinue, Fallthrough
        
        //        MARK: - Use Break
        for i in 0...5 {
            print("Break Use Print Val - \(i)")
            if i == 3 {
                break
            }
        }
        
        //        MARK: - Use Continue
        for index in 0...5 {
            if index == 2 {
                continue
            }
            print("Continue Use Print Val - \(index)")
        }
        
        // MARK: - USE Faltrough
        let check = 2
        switch check {
        case 1:
            print("Value of check -\(check) ")
        case 2:
            print("Value of check Faltrough -\(check) ")
            fallthrough
        case 3:
            print("Value of check next dtage - 3 ")
        case 4:
            print("Value of check -\(check) ")
        default:
            print("Default")
        }
    }

    //    MARK: - Diff b/w Class and Struct
    func forStructAndClassDiff()  {
        let firstNamr = MyStruct(name: "Bhupi")
        var lName = firstNamr
        lName.name = "DRJ"
        print_debug(firstNamr.name)
        print_debug(lName.name)
    }
        
    // MARK: - Hiegher order Function 1. Map, 2. Compact map, 3. Flatmap, 4. Sort, 5. filter 6. reduce
    func higherOrderFunction() {
        let mapArr = numbers.map { value in
            return value
        }
        print_debug("Map uses == \(mapArr)")
        
        // with using clouser for using map function
        let m2 = numbers.map{$0}
        print_debug("Map clouser uses == \(m2)")
        
        // with using clouser for using compactmap function
        let m3 = numbers.compactMap{$0}
        print_debug("CompactMap clouser uses == \(m3)")
        
        // with using clouser for using flatmap function
        let flatmap = multidimentionArr.flatMap{$0}
        print_debug("FlatMap clouser uses == \(flatmap)")
        
        // with using clouser for using sorted function
        let sort = numbers2.sorted()
        print_debug("Sort == \(sort)")
        
        let sort2 = numbers2.sorted(by: >=)
        print_debug("sort2 == \(sort2)")
        
//        MARK: - Reduce ka use sum krne k liye krte hai
        let reduce = numbers2.reduce(0,{$0 + $1})
        print_debug("Reduce == \(reduce)")
    }

    //    MARK: - KVC KVO
    func forKvcAndKvoUse() {
        let userName = MyClass(name: "Bhupi")
        print_debug(userName.value(forKey: "name"))
        let a = userName.observe(\.name, options: [.old, .new]) { (pokemon, value) in
            print("old name \(value.oldValue!)")
            print("new name \(value.newValue!)")
        }
//        userName.name = "DJ"
        userName.setValue("Annu", forKey: "name")
    }
    
    //    MARK: - CLOUSER R&D WORK
    func ClousersDemo() {
        basicClouser() // -Basic clouser
        clouserWithParam("Bhoopendra") // -Params with clousers
        let returnType = returnClouser(45) // - Return type clouser
        print(returnType)
        
        functionWithClouser {
            print("Function with Clouser Methos")
        } // - Function with clouser
        
        tralingClouser(message: "Hello Bhupi") {
            print("This is traling clouser function")
        } // - Traling clouser
        
        autoclouserFunction(search: print("Hello Bhupi - Autocloser with string"))
        autoclouserFunction(search: print(30))
        
        nonEscapingClouser {
            print_debug("Bhupi Non-Escaping")
        }
        
        escapingClouser {
            print_debug("Bhupi Escaping closer")
        }
    }
    
    //  MARK: - Basic Claouser
    let basicClouser = {
        print("Hello Bhupi")
    }
    //    MARK: - Clouser with params
    let clouserWithParam = { (name: String) in
        print(name)
    }
    
    //    MARK: - Clouser with return type
    let returnClouser = { (age: Int) ->(Int) in
        let val = age + 20
        return val
    }
    //    MARK: - Clouser as a function params
    func functionWithClouser(data: () -> ()) {
        print("This is function with clouser")
        // Call the clouser
        data()
    }
    
    //    MARK: - Trailing clousers
    func tralingClouser(message:String, search: () -> ()) {
        print(message)
        search()
    }
    
    //    MARK: - autoclosure type of clouser
    func autoclouserFunction(search: @autoclosure () -> ()) {
        search()
    }
    
//    MARK: - Non - Escaping closres
    func nonEscapingClouser(serach: () -> ()) {
        print_debug("Function calling start")
        serach()
        print_debug("End")
    }
    
//    MARK: - Escaping closers
    func escapingClouser(serach: @escaping()->()) {
        print_debug("Function calling start")
        DispatchQueue.global().async {
            serach()
        }
        print_debug("End")
    }
    
    
//    MARK: - INOUT Parametrs use
    func inOutFunction() {
        print_debug("Before the inout function \(fixValue)")
        inoutParameterUse(number: &fixValue)
        print_debug("After the inout function \(fixValue)")
    }
    
    func inoutParameterUse(number: inout Int) {
        number = 150
    }
    @IBAction func buttonAction(_ sender: Any) {
        let nxVC = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MapVC") as? MapVC)!
        self.navigationController?.pushViewController(nxVC, animated: false)
    }
}

func autoClsrExmpl(message: String,search: @autoclosure () -> ()) {
    print_debug("Normal Messages : \(message)")
    search()
}

func trlingClsr(message: String, data : () -> ()) {
    print_debug("====\(message)")
    data()
}

extension UIViewController {
    func getScreenshot() -> UIImage? {
        //creates new image context with same size as view
        // UIGraphicsBeginImageContextWithOptions (scale=0.0) for high res capture
        UIGraphicsBeginImageContextWithOptions(view.frame.size, true, 0.0)
        
        // renders the view's layer into the current graphics context
        if let context = UIGraphicsGetCurrentContext() { view.layer.render(in: context) }
        
        // creates UIImage from what was drawn into graphics context
        let screenshot: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        
        // clean up newly created context and return screenshot
        UIGraphicsEndImageContext()
        return screenshot
    }
   
    func urlSessionApi() {
        let urlService = URL(string: "https://dummy.restapiexample.com/api/v1/employees")!
        let request = NSURLRequest(url: urlService)
        URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            print_debug("Data-\(data)")
            print_debug("response-\(response)")
            print_debug("error-\(error)")
        }
    }
    
    func dummyTesting(){
        let basicClouserForTesting = {
            print_debug("This is basic clouser so please ignore")
        }
        print_debug(basicClouserForTesting())

    }
}


class Singltone22 {
    static let shared = Singltone22()
    private init() {}
    func useSingleton() {
        print_debug("Hello Singltone")
    }
}


class User {
    var name: String = ""
    var completion: (() -> Void)?
    
    
    func fetchData() {
        completion = {
            print(self.name)
        }
    }
}


//class A {
//    var userA: B?
//}
//
//class B {
//    var userB: A?
//
//}
//
//var user1: A? = A()
//var user2: B? = B()
//
//
//user1?.userA = user2
//user2?.userB = user1
//
//
//user1 = nil
//user2 = nil
