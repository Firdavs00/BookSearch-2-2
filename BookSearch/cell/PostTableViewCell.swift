//
//  PostTableViewCell.swift
//  BookSearch
//
//  Created by MacBook Pro on 10/09/21.
//

import UIKit
import Kingfisher
class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var aftirName: UILabel!
    @IBOutlet weak var kitobName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
