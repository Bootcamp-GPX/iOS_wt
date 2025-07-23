//
//  UsersTableViewCell.swift
//  GopeTalkie
//
//  Created by Gopenux on 22/07/25.
//

import UIKit

class UsersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        emailLabel.textColor = .white
    }
}
