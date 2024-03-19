//
//  LoginView.swift
//  Messanger
//
//  Created by Admin on 01.02.2024.
//

import UIKit

class LoginView: UIView {
    
    //MARK: - UI Elements
    
    private let labelWelcome: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Добро пожаловать! Мы рады вас снова видеть!"
        label.font = .boldSystemFont(ofSize: 30)
        label.numberOfLines = 0
        return label
    }()
    
    let textFieldL: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Введите ваш e-mail"
        tf.layer.borderWidth = 1
        tf.layer.cornerRadius = 8
        tf.leftViewMode = .always
        tf.autocapitalizationType = .none
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        tf.backgroundColor = Colors.lightGray
        return tf
    }()
    
    let textFieldP: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Введите ваш пароль"
        tf.layer.borderWidth = 1
        tf.layer.cornerRadius = 8
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocapitalizationType = .none
        tf.leftViewMode = .always
        tf.isSecureTextEntry = true
        
        tf.backgroundColor = Colors.lightGray
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        return tf
    }()
    
    let buttonLogin: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Логин", for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .black
        return button
    }()
    
    private let labelRegist: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Нет аккаунта?"
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    
    let labelRegist2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Зарегистрироваться сейчас"
        label.font = .boldSystemFont(ofSize: 15)
        label.isUserInteractionEnabled = true
        label.textColor = Colors.lightBlue
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private methods
    
    private func setup() {
        setupLabel()
        setupTextFieldL()
        setupTextFieldP()
        setupButtonLogin()
        setupLabelRegist()
        setupLabelRegist2()
    }
    
    private func setupLabel() {
        addSubview(labelWelcome)
        
        labelWelcome.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 86).isActive = true
        labelWelcome.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        labelWelcome.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        
    }
    
    private func setupTextFieldL() {
        addSubview(textFieldL)
        
        textFieldL.topAnchor.constraint(equalTo: labelWelcome.bottomAnchor, constant: 32).isActive = true
        textFieldL.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22).isActive = true
        textFieldL.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22).isActive = true
        textFieldL.heightAnchor.constraint(equalToConstant: 56).isActive = true
    }
    
    private func setupTextFieldP() {
        addSubview(textFieldP)
        
        textFieldP.topAnchor.constraint(equalTo: textFieldL.bottomAnchor, constant: 16).isActive = true
        textFieldP.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22).isActive = true
        textFieldP.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22).isActive = true
        textFieldP.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
    }
    
    private func setupButtonLogin() {
        addSubview(buttonLogin)
        
        buttonLogin.topAnchor.constraint(equalTo: textFieldP.bottomAnchor, constant: 62).isActive = true
        buttonLogin.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22).isActive = true
        buttonLogin.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22).isActive = true
        buttonLogin.heightAnchor.constraint(equalToConstant: 56).isActive = true
    }
    
    private func setupLabelRegist() {
        addSubview(labelRegist)
        
        labelRegist.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -105).isActive = true
        labelRegist.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -28).isActive = true
    }
    
    private func setupLabelRegist2() {
        addSubview(labelRegist2)
        
        labelRegist2.leadingAnchor.constraint(equalTo: labelRegist.trailingAnchor, constant: 2).isActive = true
        labelRegist2.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -28).isActive = true
    }
}
