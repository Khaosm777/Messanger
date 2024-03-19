//
//  MainTabBarController.swift
//  Messanger
//
//  Created by Admin on 01.02.2024.
//

import UIKit
import FirebaseAuth

final class MainTabBarController: UITabBarController {
    
    private var chatsViewController: UINavigationController {
        let viewController = ChatsListViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        viewController.tabBarItem = UITabBarItem(
            title: "Chats",
            image: UIImage(systemName: "message"),
            selectedImage: UIImage(systemName: "message.fill")
        )
        return navigationController
    }
    
    private var profileViewController: UINavigationController {
        let viewController = ProfileViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        viewController.tabBarItem = UITabBarItem(
            title: "Progile",
            image: UIImage(systemName: "person"),
            selectedImage: UIImage(systemName: "person.fill")
        )
        return navigationController
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        viewControllers = [chatsViewController,profileViewController]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if FirebaseAuth.Auth.auth().currentUser == nil {
            print(FirebaseAuth.Auth.auth().currentUser?.email)
            showLoginScreen()
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(loginDidFinish), name: Notifications.loginDidFinish, object: nil)
    }
    
    private func showLoginScreen() {
        let vc = LoginViewController()
        vc.modalPresentationStyle = .fullScreen
        
        present(vc, animated: true)
    }
    
    @objc
    private func loginDidFinish() {
        selectedIndex = 0
    }
}
