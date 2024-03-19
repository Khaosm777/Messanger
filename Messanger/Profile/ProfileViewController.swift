//
//  ProfileViewController.swift
//  Messanger
//
//  Created by Admin on 01.02.2024.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {
    
    private let profileImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(systemName: "person.circle")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        iv.isUserInteractionEnabled = true
        iv.layer.cornerRadius = 100
        iv.layer.borderWidth = 1
        iv.clipsToBounds = true
        return iv
    }()
    
    private let labelEmail: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "12345"
        return label
    }()
    
    private let buttonOut: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Выйти", for: .normal)
        button.backgroundColor = .red
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        title = "Profile"
        
        setupLayout()
        
        buttonOut.addTarget(self, action: #selector(OutTapped), for: .touchDown)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        labelEmail.text = FirebaseAuth.Auth.auth().currentUser?.email
    }
    
    private func setupLayout() {
        setupProfileImage()
        setupLabelEmail()
        setupButton()
    }
    
    private func setupProfileImage() {
        view.addSubview(profileImage)
        
        profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    private func setupLabelEmail() {
        view.addSubview(labelEmail)
        
        labelEmail.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 20).isActive = true
        labelEmail.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func setupButton() {
        view.addSubview(buttonOut)
        
        buttonOut.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        buttonOut.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        buttonOut.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        buttonOut.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc
    private func OutTapped() {
        let actionController = UIAlertController(title: "Вы уверены?", message: nil, preferredStyle: .alert)
        
        let actionYes = UIAlertAction(title: "Да", style: .destructive) { _ in
            do {
                try FirebaseAuth.Auth.auth().signOut()
                self.showLoginScreen()
            } catch {
                print("Не получилось выйти из аккаунта")
            }
        }
        
        let actionNo = UIAlertAction(title: "Нет", style: .default)
        
        actionController.addAction(actionYes)
        actionController.addAction(actionNo)
        
        present(actionController, animated: true)
    }
    
    func showLoginScreen() {
        let vc = LoginViewController()
        vc.modalPresentationStyle = .fullScreen
        
        present(vc, animated: true)
    }
}
