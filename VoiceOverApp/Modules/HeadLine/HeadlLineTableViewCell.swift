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
        
        // Son dos funciones para ver la diferencia entre hacer todo accesible o agrupar la información
        // Agrupar la información puede hacer la navegación mucho más facil.
        makeGroupAccessible(with: news)
    }
    
    func makeItAccessible(with news: NewsModel) {
        newsImageView.isAccessibilityElement = true
        newsImageView.accessibilityTraits = .image
        newsImageView.accessibilityLabel = news.accesibilityInfo.imageDescription
        
        newsInformationLabel.isAccessibilityElement = true
        newsInformationLabel.accessibilityTraits = .staticText
        newsInformationLabel.accessibilityLabel = news.accesibilityInfo.newsTitle
        
        dateLabel.isAccessibilityElement = true
        dateLabel.accessibilityTraits = .staticText
        dateLabel.accessibilityLabel = news.accesibilityInfo.newsDate
        
        favoriteQuantityLabel.isAccessibilityElement = true
        favoriteQuantityLabel.accessibilityTraits = .staticText
        favoriteQuantityLabel.accessibilityValue = "Número de personas a las que les gustó esta noticia: \(news.likes)"
        
        favoriteImageView.isAccessibilityElement = false
    }
    
    func makeGroupAccessible(with news: NewsModel) {
        newsImageView.isAccessibilityElement = false
        dateLabel.isAccessibilityElement = false
        favoriteQuantityLabel.isAccessibilityElement = false
        favoriteImageView.isAccessibilityElement = false
        newsInformationLabel.isAccessibilityElement = false
        
        isAccessibilityElement = true
        accessibilityTraits = .staticText
        
        let accessibilityText = news.accesibilityInfo.newsTitle +
            news.accesibilityInfo.newsDate +
        "Número de personas a las que les gustó esta noticia: \(news.likes)"
        
        accessibilityLabel = accessibilityText
        accessibilityHint = "Toca dos veces para escuchar esta noticia."
    }
}
