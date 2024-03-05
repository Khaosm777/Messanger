//
//  RegisterView.swift
//  Messanger
//
//  Created by Admin on 12.02.2024.
//

import UIKit

final class RegisterView: UIView {
    
    //MARK: - UI Elements
    
    private let labelWelcome: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Привет! Зарегистрируйтесь, чтобы начать."
        label.font = .boldSystemFont(ofSize: 30)
        label.numberOfLines = 0
        return label
    }()
    
    var avatarImage: UIImageView = {
        let imageV = UIImageView()
        imageV.translatesAutoresizingMaskIntoConstraints = false
        imageV.image = UIImage(systemName: "person.circle")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        imageV.isUserInteractionEnabled = true
        imageV.layer.borderWidth = 1
        imageV.layer.cornerRadius = 50
        imageV.clipsToBounds = true
        return imageV
    }()
    
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.spacing = 12
        return sv
    }()
    
    let textFieldN: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Имя"
        tf.layer.borderWidth = 1
        tf.layer.cornerRadius = 8
        tf.backgroundColor = Colors.lightGray
        tf.leftViewMode = .always
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        return tf
    }()
    
    let textFieldE: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.layer.borderWidth = 1
        tf.layer.cornerRadius = 8
        tf.backgroundColor = Colors.lightGray
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.leftViewMode = .always
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        return tf
    }()
    
    let textFieldP: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Пароль"
        tf.layer.borderWidth = 1
        tf.layer.cornerRadius = 8
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.leftViewMode = .always
        tf.isSecureTextEntry = true
        tf.backgroundColor = Colors.lightGray
        
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        return tf
    }()
    
    let textFieldCP: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Повторите пароль"
        tf.layer.borderWidth = 1
        tf.layer.cornerRadius = 8
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.leftViewMode = .always
        tf.backgroundColor = Colors.lightGray
        tf.isSecureTextEntry = true
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        return tf
    }()
    
    let buttonReg: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Зарегистрироваться", for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .black
        return button
    }()
    
    private let labelRegist: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Уже есть аккаунт?"
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    
    let labelRegist2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Авторизоваться сейчас"
        label.font = .boldSystemFont(ofSize: 15)
        label.isUserInteractionEnabled = true
        label.textColor = Colors.lightBlue
        label.isUserInteractionEnabled = true
        return label
    }()
    
    //MARK: - Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setupLayour()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    private func setupLayour() {
        setupLabel()
        setupAvatar()
        setupStackView()
        setupButtonLogin()
        setupLabelRegist()
        setupLabelRegist2()
    }
    
    private func setupLabel() {
        addSubview(labelWelcome)
        
        labelWelcome.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 44).isActive = true
        labelWelcome.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        labelWelcome.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        
    }
    
    private func setupAvatar() {
        addSubview(avatarImage)
        
        avatarImage.topAnchor.constraint(equalTo: labelWelcome.bottomAnchor, constant: 24).isActive = true
        avatarImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        avatarImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        avatarImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    private func setupStackView() {
        addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 24).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        
        stackView.addArrangedSubview(textFieldN)
        stackView.addArrangedSubview(textFieldE)
        stackView.addArrangedSubview(textFieldP)
        stackView.addArrangedSubview(textFieldCP)
        textFieldN.heightAnchor.constraint(equalToConstant: 56).isActive = true
        textFieldE.heightAnchor.constraint(equalToConstant: 56).isActive = true
        textFieldP.heightAnchor.constraint(equalToConstant: 56).isActive = true
        textFieldCP.heightAnchor.constraint(equalToConstant: 56).isActive = true
    }
    
    private func setupButtonLogin() {
        addSubview(buttonReg)
        
        buttonReg.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 62).isActive = true
        buttonReg.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22).isActive = true
        buttonReg.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22).isActive = true
        buttonReg.heightAnchor.constraint(equalToConstant: 56).isActive = true
    }
    
    private func setupLabelRegist() {
        addSubview(labelRegist)
        
        labelRegist.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -88).isActive = true
        labelRegist.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -28).isActive = true
    }
    
    private func setupLabelRegist2() {
        addSubview(labelRegist2)
        
        labelRegist2.leadingAnchor.constraint(equalTo: labelRegist.trailingAnchor, constant: 2).isActive = true
        labelRegist2.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -28).isActive = true
    }
}
