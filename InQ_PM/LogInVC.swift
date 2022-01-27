//
//  ViewController.swift
//  InQ_PM
//
//  Created by RooZin on 2022/01/18.
//

import UIKit

class LogInVC: UIViewController {

    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var pwField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        idField.text = "ID"
        pwField.text = "PW"
    }
}

