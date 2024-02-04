//
//  LoginView.swift
//  Messanger
//
//  Created by Admin on 01.02.2024.
//

import UIKit

class LoginView: UIView {
    
    //MARK: - UI Elements
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Добро пожаловать! Мы рады вас снова видеть!"
        label.font = .boldSystemFont(ofSize: 30)
        label.numberOfLines = 0
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
    }
    
    private func setupLabel() {
        addSubview(label)
        
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        label.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        
    }
}
