//
//  ViewController.swift
//  UnitTestingProject
//
//  Created by APPLE on 15/09/25.
//

import UIKit

class ViewController: UIViewController {
    var vm = ViewModal()
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var user1: String = "" {
        willSet {
            print("New value is: \(newValue)")
        }
        didSet {
            print("Old value was: \(oldValue)")
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        user1 = "Bhupi"
        
        user1 = "BKK"
        
        vm.onSuccess = { user in
            print("Hello User\(user)")
        }
        
        vm.onFailure = { error in
            print(error)
        }
      //  print(moveToZero([0,1,0,3,0,12]))
//        var strValue = "aaabbbcccddddddd"
//        let outputShould = "3a3b3c6d"
//        getTheArrayCalculatioon()
//        print(twoValueSome([2,3,7,11,15]))
//      //  print(campare2(strValue))
//
//        print(reverseWords("Hello Woord"))
//        
//        _ = cacluateValue(x: 10, y: 20)
        print(reverseWord("the sky is blue"))
        
    }
    
    func reverseWord(_ string: String) -> String {
        var worldArray = Array(string)
        var result = ""
        var word = ""
        
        for i in stride(from: worldArray.count - 1, through: 0, by: -1) {
            if worldArray[i] == " " {
                result += word + " "
                word = ""
            } else {
                word = String(worldArray[i]) + word
            }
        }
        result += word
        return result
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        
        vm.validateUser(name: userName.text ?? "", pswd: password.text ?? "" )
    }
    
    func encoddeData() {
        let data = ["name":"bhupi","age":"30","exp":"6"]
        let user = User(firstName: "Bhupi", email: "i@b.com")
        do {
            let jsonData = try JSONEncoder().encode(user)
            if let jsonSString = String(data: jsonData, encoding: .utf8) {
                print(jsonSString)
            }
        } catch {
            print("Error")
        }
    }
    
    /*
    func cacluateValue(x: Int, y: Int) -> Int {
        return (x - y)
    }
    
    func reverseWords(_ input: String) -> String {
        let words = input.split(separator: " ")
        let reversed = words.reversed()
        return reversed.joined(separator: " ")
    }

    
    func campare2(_ input: String) -> String {
        var count = 1
        var result = ""
        var previousValue: Character = input.first!
        
        for val in input.dropFirst() {
            if val == previousValue {
                count += 1
            } else {
                result += "\(count)\(previousValue)"
                count = 1
                previousValue = val
            }
        }
        result += "\(count)\(previousValue)"
        return result
    }
    
    func sencondLargestVlaue(_ arr: [Int]) {
        let array1 = [10, 5, 20, 8, 20]
        
        var maxVale: Int = Int.min
        var secondLargestVale: Int = Int.min
        
        for number in array1 {
            if number > maxVale {
                secondLargestVale = maxVale
                maxVale = number
                
            } else if (number > secondLargestVale && number != maxVale) {
                secondLargestVale = number
            }
        }
        
        print(secondLargestVale)
        print(maxVale)
    }
    
    func twoValueSome(_ inputArray: [Int]) {
        var target = 18
        var dict: [Int: Int] = [:]
        for (index, value) in inputArray.enumerated() {
            var complemnt = target - value
            if let complementIndex = dict[complemnt] {
                print("Indexes: \(complementIndex), \(index)")
                print("Values: \(inputArray[complementIndex]), \(value)")
            }
            dict[value] = index
        }
    }
    
    func moveToZero(_ input: [Int]) -> [Int] {
        var withOutZero:[Int] = []
        var withZero: [Int] = []
        
        var finalArr:[Int] = []
        for number in input {
            if number == 0 {
                withZero.append(number)
            } else {
                withOutZero.append(number)
            }
        }
        
        finalArr = withOutZero + withZero
        return finalArr
    }
    
    
    func getTheArrayCalculatioon() {
        //.   Given an array of places, show only those whose place_type is "Restaurant" and whose distance is less than 500. The resulting list should be displayed in descending order.
        
        var placesArray = [
            ["id": 1,  "place_type": "Restaurant",   "name": "Calzone Corner",     "distance": 120,  "measurement_type": "meters", "rating": "4.3"],
            ["id": 2,  "place_type": "Cafe",         "name": "Bean & Brew",        "distance": 75,   "measurement_type": "meters", "rating": "3.9"],
            ["id": 3,  "place_type": "Retail Store", "name": "Sole Street Shoes",  "distance": 430,  "measurement_type": "meters", "rating": "4.1"],
            ["id": 4,  "place_type": "Restaurant",   "name": "Tandoori Terrace",   "distance": 980,  "measurement_type": "meters", "rating": "4.8"],
            ["id": 5,  "place_type": "Cafe",         "name": "Morning Mingle",     "distance": 210,  "measurement_type": "meters", "rating": "4.0"],
            ["id": 6,  "place_type": "Retail Store", "name": "Urban Outfit Depot", "distance": 1500, "measurement_type": "meters", "rating": "3.6"],
            ["id": 7,  "place_type": "Restaurant",   "name": "Seaside Sushi",      "distance": 320,  "measurement_type": "meters", "rating": "4.7"],
            ["id": 8,  "place_type": "Cafe",         "name": "The Quiet Cup",      "distance": 45,   "measurement_type": "meters", "rating": "4.2"],
            ["id": 9,  "place_type": "Retail Store", "name": "Gadget Gallery",     "distance": 680,  "measurement_type": "meters", "rating": "4.4"],
            ["id": 10, "place_type": "Restaurant",   "name": "Spice Route",        "distance": 540,  "measurement_type": "meters", "rating": "3.7"],
            ["id": 11, "place_type": "Cafe",         "name": "Roast Republic",     "distance": 260,  "measurement_type": "meters", "rating": "4.5"],
            ["id": 12, "place_type": "Retail Store", "name": "Home Harmony",       "distance": 1100, "measurement_type": "meters", "rating": "4.0"],
            ["id": 13, "place_type": "Restaurant",   "name": "Green Garden Grill", "distance": 190,  "measurement_type": "meters", "rating": "4.6"],
            ["id": 14, "place_type": "Cafe",         "name": "Pancake Plaza",      "distance": 360,  "measurement_type": "meters", "rating": "3.5"],
            ["id": 15, "place_type": "Restaurant",   "name": "Royal Feast",        "distance": 25,   "measurement_type": "meters", "rating": "4.9"]
        ]
        
        var calaculateArra: [[String: Any]] = []
        for array in placesArray {
            if let type = array["place_type"] as? String, let distance = array["distance"] as? Int, distance < 500, type == "Restaurant" {
                calaculateArra.append(array)
            }
        }
        print(calaculateArra)
        
        calaculateArra.sort{($0["distance"] as? Int ?? 0) > ($1["distance"] as? Int ?? 0)}
        print(calaculateArra)
    }
    */
    
}


//var dict: [String: String] = [:]
//NSArray * arr = @[@1,@2,@4,@7];

