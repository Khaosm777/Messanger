//
//  ChatsTableViewCell.swift
//  Messanger
//
//  Created by Admin on 17.03.2024.
//

import UIKit

class ChatsTableViewCell: UITableViewCell {
    
    static let reuseId = "ChatsTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
