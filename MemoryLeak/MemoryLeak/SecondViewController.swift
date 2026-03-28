//
//  SecondViewController.swift
//  MemoryLeak
//
//  Created by APPLE on 20/12/25.
//

import UIKit

class SecondViewController: UIViewController {
var vm = ViewModel()
    override func viewDidLoad() {
        
        super.viewDidLoad()

        var objA: A? = A()
        var objB: B? = B()
        
        objA?.b = objB
        objB?.a = objA
        
        objA = nil
        objB = nil
        
        NotificationCenter.default.addObserver(
              self,
              selector: #selector(fetchDdata),
              name: Notification.Name("Bhupi"),
              object: nil
          )
        
        
        // Do any additional setup after loading the view.
    }
    
    @objc func fetchDdata() {
        print("Fetched")
    }
    
    
    @IBAction func buttonAction(_ sender: UIButton) {
//        self.navigationController?.popViewController(animated: true)
        let sstory = UIStoryboard(name: "Main", bundle:  nil)
        let push = sstory.instantiateViewController(identifier: "ThirdViewController")
        self.navigationController?.pushViewController(push, animated: true)
    }
  
    deinit {
        print("SecondVC deallocated")
    }
}


class A {
    var b: B?
    deinit
    {
        print("A deinitialized")
    }
}

class B {
    var a: A?
    deinit 
    {
        print("B deinitialized")
    }
}

class ViewModel {
    var onUpdate: (() -> Void)?
}
