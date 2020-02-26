//
//  VCCategory.swift
//  OrdinarioIOS
//
//  Created by Alejandro Sanz Muñoz on 26/2/20.
//  Copyright © 2020 ALEJANDRO SANZ MUÑOZ. All rights reserved.
//

import UIKit

class VCCategory: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    let cellCatIdentifier = "categoryCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categorys.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellCatIdentifier, for: indexPath)
        let arrayC = categorys[indexPath.row]
        cell.textLabel?.text = arrayC
        return cell
    }
    
    @IBAction func addCategory(_ sender: Any) {
        let alert = UIAlertController(title: "Add", message: "Añadir una categoría nueva", preferredStyle: .alert)

        alert.addTextField { (textField) in
            textField.text = "" // Empty text
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            // Cancel
        }))
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0]
            categorys.append(textField.text ?? "Empty")
            self.tableView.reloadData()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        actual = categorys[indexPath.row]
        self.performSegue(withIdentifier: "goItems", sender: VCItem.self)
    }
}
