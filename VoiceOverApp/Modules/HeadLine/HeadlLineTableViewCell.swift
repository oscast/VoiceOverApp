//
//  HeadlLineTableViewCell.swift
//  VoiceOverApp
//
//  Created by Oscar Castillo on 9/16/20.
//

import UIKit

class HeadlLineTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsInformationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var favoriteQuantityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        newsImageView.layer.cornerRadius = 15.0
    }
}
