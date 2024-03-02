//
//  RegisterViewController.swift
//  Messanger
//
//  Created by Admin on 12.02.2024.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let mainView = RegisterView()
    
    override func loadView() {
        view = mainView
        
        mainView.buttonReg.addTarget(self, action: #selector(tappedButtonReg), for: .touchDown)
        mainView.labelRegist2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tappedLabelReg)))
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @objc
    private func tappedButtonReg() {
        dismiss(animated: true)
    }
    
    @objc
    private func tappedLabelReg() {
        dismiss(animated: true)
    }
}
