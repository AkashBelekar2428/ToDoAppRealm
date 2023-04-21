//
//  ContactViewController.swift
//  ToDoAppRealm
//
//  Created by Akash Belekar on 20/04/23.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var contactTbl: UITableView!
    
    var categoriModel = [DataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         configuration()
       
    }

    @IBAction func addDetailsBtn(_ sender: UIButton) {
        
        //MARK: Add UIAlertController
        let alert = UIAlertController(title: "Add Name", message: "Please Add Details", preferredStyle: .alert)
        
        let save = UIAlertAction(title: "Save", style: .default){ _ in
            if let txtFirstName = alert.textFields?.first!.text,
               let txtLastName = alert.textFields?[1].text{
                let contact = DataModel(fisrtName: txtFirstName,lastName: txtLastName)
                self.categoriModel.append(contact)
                self.contactTbl.reloadData()
                print(txtFirstName,txtLastName)
            }
        }
        
        let cancle = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(save)
        alert.addAction(cancle)
        
        present(alert, animated: true)
        
        //MARK: Add UITexrFiled
        
        alert.addTextField{ firstName in
            firstName.placeholder = "Enter Your FirstName"
        }
        
        alert.addTextField{ lastName in
            lastName.placeholder = "Enter Your LastName"
        }
    }
}
extension ContactViewController{
    
    func  configuration(){
        contactTbl.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        contactTbl.dataSource = self
        contactTbl.delegate = self
    }
}
//MARK: UITableViewDataSource
extension ContactViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard var cell = tableView.dequeueReusableCell(withIdentifier: "cell") else{
            return UITableViewCell()
        }
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = categoriModel[indexPath.row].fisrtName
        cell.detailTextLabel?.text = categoriModel[indexPath.row].lastName
        return cell
    }
}
//MARK: UITableViewDelegate
extension ContactViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "Edit") { _, _, _ in
            let alert = UIAlertController(title: "Add Name", message: "Please Add Details", preferredStyle: .alert)
            
            let save = UIAlertAction(title: "Save", style: .default){ _ in
                if let txtFirstName = alert.textFields?.first!.text,
                   let txtLastName = alert.textFields?[1].text{
                    let contact = DataModel(fisrtName: txtFirstName,lastName: txtLastName)
                    self.categoriModel.append(contact)
                    self.contactTbl.reloadData()
                    print(txtFirstName,txtLastName)
                }
            }
            
            let cancle = UIAlertAction(title: "Cancel", style: .cancel)
            
            alert.addAction(save)
            alert.addAction(cancle)
            
            self.present(alert, animated: true)
            
            //MARK: Add UITexrFiled
            
            alert.addTextField{ firstName in
                firstName.placeholder = self.categoriModel[indexPath.row].fisrtName
                
            }
            alert.addTextField{ lastName in
                lastName.placeholder = self.categoriModel[indexPath.row].lastName
                
            }
        }
        edit.backgroundColor = .systemMint
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            
        }
        
        let swipeActionConfiguration = UISwipeActionsConfiguration(actions: [delete,edit])
        return swipeActionConfiguration
    }
    
}
    
