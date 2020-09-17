//
//  HeadlLineTableViewCell.swift
//  VoiceOverApp
//
//  Created by Oscar Castillo on 9/16/20.
//

import UIKit
import SDWebImage

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
    
    func setup(with news: NewsModel) {
        newsInformationLabel.text = news.newsTitle
        dateLabel.text = news.newsDate
        favoriteImageView.image = UIImage(named: "favorite")
        favoriteQuantityLabel.text = "\(news.likes)"
        let url = URL(string: news.image)
        newsImageView.sd_setImage(with: url, completed: nil)
    }
}
