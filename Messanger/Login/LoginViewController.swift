//
//  LoginViewController.swift
//  Messanger
//
//  Created by Admin on 01.02.2024.
//

import UIKit

class LoginViewController: UIViewController {
    
    let newView = LoginView()
    
    override func loadView() {
        view = newView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
