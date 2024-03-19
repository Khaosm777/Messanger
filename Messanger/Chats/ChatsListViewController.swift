//
//  ChatsListViewController.swift
//  Messanger
//
//  Created by Admin on 01.02.2024.
//

import UIKit

final class ChatsListViewController: UIViewController {
    
    let chats: [Chat] = []
    
    
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.rowHeight = 100
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        title = "Chats"
        
        search()
        setupTableView()
    }
    
    //MARK: - Private methods
    
    
    private func search() {
        let searchController = UISearchController()
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(ChatsTableViewCell.self, forCellReuseIdentifier: ChatsTableViewCell.reuseId)
        
        setupLayourTV()
    }
    
    private func setupLayourTV() {
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
    
//    private func showLoginScreen() {
//        let vc = LoginViewController()
//        vc.modalPresentationStyle = .fullScreen
//
//        present(vc, animated: true)
//    }


extension ChatsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatsTableViewCell.reuseId, for: indexPath)
                as? ChatsTableViewCell
        else {
            fatalError("Не получилось загрузить таблицу")
        }
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    
}

extension ChatsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ChatViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
