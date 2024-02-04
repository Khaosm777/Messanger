//
//  ChatsListViewController.swift
//  Messanger
//
//  Created by Admin on 01.02.2024.
//

import UIKit

final class ChatsListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        title = "Chats"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showLoginScreen()
    }
    //MARK: - Private methods
    
    private func showLoginScreen() {
        let vc = LoginViewController()
//        vc.modalPresentationStyle = .fullScreen
        
        present(vc, animated: true)
    }
}
