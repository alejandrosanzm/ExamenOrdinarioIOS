//
//  ViewController.swift
//  OrdinarioIOS
//
//  Created by Alejandro Sanz Muñoz on 26/2/20.
//  Copyright © 2020 ALEJANDRO SANZ MUÑOZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtErrorMsg: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnSend(_ sender: Any) {
        let user = "admin"
        let password = "1234"
        
        if(txtUsername.text == user && txtPassword.text == password) {
            self.performSegue(withIdentifier: "goCats", sender: VCCategory.self)
        } else {
            txtErrorMsg.text = "Credenciales incorrectas!"
            txtUsername.text = ""
            txtPassword.text = ""
        }
    }
}
