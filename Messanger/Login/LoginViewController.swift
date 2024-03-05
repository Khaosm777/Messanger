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
        
        newView.buttonLogin.addTarget(self, action: #selector(buttonLoginTapped), for: .touchDown)
        newView.labelRegist2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tappedLabelRegist)))
        
        NotificationCenter.default.addObserver(self, selector: #selector(registFinish), name: Notifications.registerDidFinish, object: nil)
    }
    
    @objc
    private func registFinish() {
        dismiss(animated: true)
    }
    
    @objc
    private func buttonLoginTapped() {
        dismiss(animated: true)
    }
    
    @objc
    private func tappedLabelRegist() {
        let vc = RegisterViewController()
        vc.modalPresentationStyle = .fullScreen
        
        present(vc, animated: true)
    }
}
