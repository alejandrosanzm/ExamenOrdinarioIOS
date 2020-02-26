//
//  VCItem.swift
//  OrdinarioIOS
//
//  Created by Alejandro Sanz Muñoz on 26/2/20.
//  Copyright © 2020 ALEJANDRO SANZ MUÑOZ. All rights reserved.
//

import UIKit

class VCItem: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var category: String = actual!
    let cellItIdentifier = "itemCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks[category]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellItIdentifier, for: indexPath)
        let arrayC = tasks[category]?[indexPath.row]
        cell.textLabel?.text = arrayC
        return cell
    }
    
    @IBAction func addItem(_ sender: Any) {
        let alert = UIAlertController(title: "Add", message: "Añadir un item nuevo", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.text = "" // Empty text
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            // Cancel
        }))
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0]
            tasks[self.category]?.append(textField.text ?? "")
            self.tableView.reloadData()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}
