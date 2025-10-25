//
//  ListUsersTableViewCell.swift
//  GopeTalkie
//
//  Created by Gopenux on 12/10/25.
//

import UIKit

class ListUsersTableViewCell: UITableViewCell {

    @IBOutlet weak var customImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }
}
