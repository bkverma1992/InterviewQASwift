//
//  ViewController.swift
//  MemoryLeak
//
//  Created by APPLE on 20/12/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(identifier: "SecondViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
