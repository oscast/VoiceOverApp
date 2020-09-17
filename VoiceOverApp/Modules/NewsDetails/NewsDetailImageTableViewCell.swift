//
//  NewsDetailImageTableViewCell.swift
//  AccessibilityNews
//
//  Created by Oscar Castillo on 9/16/20.
//

import UIKit

class NewsDetailImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsDetailImageView: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var newsIsFavorite = false
    let favoriteImage = UIImage(named: "favorite")
    let unfavoriteImage = UIImage(named: "unfavorite")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        newsDetailImageView.layer.cornerRadius = 15.0
    }
    
    @IBAction func favorite(_ sender: Any) {
        newsIsFavorite.toggle()
        checkFavorite(isFavorite: newsIsFavorite)
    }
    
    func setup(with news: NewsModel) {
        checkFavorite(isFavorite: newsIsFavorite)
    }
    
    func checkFavorite(isFavorite: Bool) {
        let image = newsIsFavorite ? favoriteImage: unfavoriteImage
        favoriteButton.setImage(image, for: .normal)
    }
}
