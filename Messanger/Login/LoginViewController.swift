//
//  LoginViewController.swift
//  Messanger
//
//  Created by Admin on 01.02.2024.
//

import UIKit

class LoginViewController: UIViewController {
    
    let newView = LoginView()
    let loginNetworkService = LoginNetworkService()
    
    override func loadView() {
        view = newView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        newView.buttonLogin.addTarget(self, action: #selector(buttonLoginTapped), for: .touchDown)
        newView.labelRegist2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tappedLabelRegist)))
        
        NotificationCenter.default.addObserver(self, selector: #selector(registFinish), name: Notifications.loginDidFinish, object: nil)
    }
    
    @objc
    private func registFinish() {
        dismiss(animated: true)
    }
    
    @objc
    private func buttonLoginTapped() {
        guard let email = newView.textFieldL.text,
              let password = newView.textFieldP.text
        else {
            return
        }
        
        loginNetworkService.login(email: email, password: password) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
                
            case .success(let email):
                NotificationCenter.default.post(name: Notifications.loginDidFinish, object: nil)
                self.dismiss(animated: true)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @objc
    private func tappedLabelRegist() {
        let vc = RegisterViewController()
        vc.modalPresentationStyle = .fullScreen
        
        present(vc, animated: true)
    }
}
