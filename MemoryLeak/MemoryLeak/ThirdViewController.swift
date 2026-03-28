//
//  ThirdViewController.swift
//  MemoryLeak
//
//  Created by APPLE on 28/12/25.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let push = story.instantiateViewController(identifier: "FourthViewController")
        self.navigationController?.pushViewController(push, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
