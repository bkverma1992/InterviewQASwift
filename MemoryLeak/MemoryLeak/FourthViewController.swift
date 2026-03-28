//
//  FourthViewController.swift
//  MemoryLeak
//
//  Created by APPLE on 28/12/25.
//

import UIKit

class FourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        if let vc = navigationController?.viewControllers {
            for viewCntrlr in vc {
                if viewCntrlr is SecondViewController {
                    self.navigationController?.popToViewController(viewCntrlr, animated: true)
                    break
                }
            }
        }
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
