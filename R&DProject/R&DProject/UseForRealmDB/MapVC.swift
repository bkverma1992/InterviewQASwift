//
//  MapVC.swift
//  R&DProject
//
//  Created by Admin on 04/08/23.
//

import UIKit
import MapKit
import RealmSwift

class MapVC: UIViewController {
    var realmDB: Realm!
    @IBOutlet weak var tableView: UITableView!
    var userList:[userData] = []
    @IBOutlet weak var mapView: MKMapView!
   
//    MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.isHidden = true
        realmDB = try! Realm()
        readRealm()
    }
    
    @IBAction func SSAction(_ sender: Any) {
        //  let SSImage = getScreenshot()
        //  print_debug(SSImage)
        let alert = UIAlertController(title: "Some Title", message: "Enter a text", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = "Some default text"
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self, weak alert] (_) in
            let textField = alert?.textFields![0]
            print("Text field: \(textField?.text)")
            if let textData = textField?.text {
                createRealm(text: textData)
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    //   MARK: - CRUD
    //    MARK: - CREATE (ADD DATA) to REALM DB
    func createRealm(text: String) {
        let user = userData()
        user.userDetails = text
        user.userID = UUID().uuidString
        userList.append(user)
        
        try! self.realmDB?.write {
            self.realmDB?.add(userList)
        }
        tableView.reloadData()
    }
    
    //    MARK: - READ DATA FROM REALM DATABASE
    func readRealm() {
        let notes = realmDB.objects(userData.self)
        userList.removeAll()
        if !notes.isEmpty {
            for n in notes {
                self.userList.append(n)
            }
            self.tableView.reloadData()
        }
    }
    
    //    MARK: - UPDATE (UPDATE DATA) to REALM DB
    func upddateRealm(currentTab: userData, text: String) {
        try! self.realmDB?.write {
            currentTab.userDetails = text
        }
        tableView.reloadData()
    }
    
    //    MARK: - DELETE (DELETE DATA) from REALM DB
    func deleteRealm(currentTab: userData, index: IndexPath) {
        try! self.realmDB?.write {
            self.realmDB.delete(currentTab)
            userList.remove(at: index.row)
            tableView.deleteRows(at: [index], with: .fade)
        }
    }
}



extension MapVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell.textLabel?.text = userList[indexPath.row].userDetails
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let data = userList[indexPath.row] as? userData {
            let ac = UIAlertController(title: "Update task", message: nil, preferredStyle: .alert)
            
            ac.addTextField(configurationHandler: .none)
            ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [self] (UIAlertAction) in
                if let text = ac.textFields?.first?.text
                {
                    if(!text.isEmpty)
                    {
                        upddateRealm(currentTab: data, text: text)
                    }
                }
            }))
            
            present(ac, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let data = userList[indexPath.row]
           deleteRealm(currentTab: data, index: indexPath)
        }
    }
}
