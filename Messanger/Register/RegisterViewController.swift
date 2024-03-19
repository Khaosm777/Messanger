//
//  RegisterViewController.swift
//  Messanger
//
//  Created by Admin on 12.02.2024.
//

import UIKit

final class RegisterViewController: UIViewController {
    
    let mainView = RegisterView()
    let registNetworkService = RegisterNetworkService()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.buttonReg.addTarget(self, action: #selector(tappedButtonReg), for: .touchDown)
        mainView.labelRegist2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tappedLabelReg)))
        mainView.avatarImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tappedAvatarImage)))
        
        mainView.textFieldN.delegate = self
        mainView.textFieldE.delegate = self
        mainView.textFieldP.delegate = self
        mainView.textFieldCP.delegate = self
    }
    
    @objc
    private func tappedButtonReg() {
        guard let username = mainView.textFieldN.text,
              let email = mainView.textFieldE.text,
              let passwort = mainView.textFieldP.text,
              let confirm = mainView.textFieldCP.text
        else {
            return
        }
        
        setupUsername(username: username)
        setupEmail(email: email)
        setupPasswort(passwort: passwort, confirm: confirm)
        
        registNetworkService.register(email: email, password: passwort) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let email):
                self.dismiss(animated: true)
                NotificationCenter.default.post(name: Notifications.loginDidFinish, object: nil)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @objc
    private func tappedLabelReg() {
        dismiss(animated: true)
    }
    
    func alert(title: String, message: String) {
        let viewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ок", style: .default)
        viewController.addAction(action)
        
        present(viewController, animated: true)
    }
}

//MARK: - setupTextField

extension RegisterViewController {
    
    func setupUsername(username: String) {
        guard username.count > 5 else {
            alert(title: "Ошибка в логине", message: "Должно быть больше 5 символов")
            return
        }
    }
    
    func setupEmail(email: String) {
        guard email.contains("@"),
              email.contains(".")
        else {
            alert(title: "Не правильный емайл", message: "Введите корректный")
            return
        }
    }
    
    func setupPasswort(passwort: String, confirm: String) {
        guard passwort.count > 5 else {
            alert(title: "Ошибка в пароле", message: "Должен быть больше 5 символов")
            return
        }
        
        guard passwort == confirm else {
            alert(title: "Ошибка в пароле", message: "Пароли не совпадают")
            return
        }
    }
}

//MARK: - UIImagePickerController

extension RegisterViewController {
    
    @objc
    private func tappedAvatarImage() {
        let alertController = UIAlertController(title: "Выберите один из способов?", message: nil, preferredStyle: .alert)
        
        let actionCamera = UIAlertAction(title: "С помощью камеры", style: .default) { [weak self] _ in
            self?.showCameraPicker()
        }
        
        let actionGalery = UIAlertAction(title: "Выбрать из галереи", style: .default)  { [weak self] _ in
            self?.showGaleryPicker()
        }
        
        alertController.addAction(actionCamera)
        alertController.addAction(actionGalery)
        
        present(alertController, animated: true)
    }
    
    private func showCameraPicker() {
        let viewController = UIImagePickerController()
        viewController.sourceType = .camera
        viewController.delegate = self
        viewController.allowsEditing = true

        present(viewController, animated: true)
    }
    
    private func showGaleryPicker() {
        let viewController = UIImagePickerController()
        viewController.sourceType = .photoLibrary
        viewController.delegate = self
        viewController.allowsEditing = true
        
        present(viewController, animated: true)
    }
}

//MARK: - UIImagePickerControllerDelegate

extension RegisterViewController: UIImagePickerControllerDelegate {
    func imagePickerControllerDidCancel() {
        dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            
            dismiss(animated: true)
            return
        }
        mainView.avatarImage.image = image
        
        dismiss(animated: true)
    }
}

//MARK: - UITextFieldDelegate

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField === mainView.textFieldN {
            mainView.textFieldE.becomeFirstResponder()
        } else if textField === mainView.textFieldE {
            mainView.textFieldP.becomeFirstResponder()
        } else if textField === mainView.textFieldP {
            mainView.textFieldCP.becomeFirstResponder()
        } else {
            tappedButtonReg()
        }
        
        return true
    }
}

//MARK: - UINavigationControllerDelegate

extension RegisterViewController: UINavigationControllerDelegate {}

