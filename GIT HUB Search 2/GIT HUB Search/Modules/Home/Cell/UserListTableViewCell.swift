//
//  UserListTableViewCell.swift
//  GIT HUB Search
//
//  Created by Adwaith V V on 28/05/23.
//

import UIKit

class UserListTableViewCell: UITableViewCell {

    @IBOutlet weak var imageBackrgroundView: UIView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageBackrgroundView.layer.cornerRadius = 20
        self.profileImage.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
