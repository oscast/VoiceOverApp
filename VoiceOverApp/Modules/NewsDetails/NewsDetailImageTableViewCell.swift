//
//  NewsDetailImageTableViewCell.swift
//  VoiceOverApp
//
//  Created by Oscar Castillo on 9/16/20.
//

import UIKit
import SDWebImage

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
        let url = URL(string: news.image)
        newsDetailImageView.sd_setImage(with: url, completed: nil)
        makeItAccessible(with: news)
    }
    
    func checkFavorite(isFavorite: Bool) {
        let image = newsIsFavorite ? favoriteImage: unfavoriteImage
        favoriteButton.setImage(image, for: .normal)
        setupFavoriteButtonAccessibility()
    }
    
    func makeItAccessible(with news: NewsModel) {
        newsDetailImageView.isAccessibilityElement = true
        newsDetailImageView.accessibilityTraits = .image
        newsDetailImageView.accessibilityLabel = news.accesibilityInfo.imageDescription
        
        favoriteButton.isAccessibilityElement = true
        favoriteButton.accessibilityTraits = .button
        setupFavoriteButtonAccessibility()
    }
    
    func setupFavoriteButtonAccessibility() {
        let selectedMessage = newsIsFavorite ? "Seleccionado.": "No seleccionado."
        favoriteButton.accessibilityLabel = "Agregar a favoritos: \(selectedMessage)"
        let actionMessage = newsIsFavorite ? "eliminar de favoritos.": "agregar a favoritos."
        favoriteButton.accessibilityHint = "Toca dos veces para \(actionMessage)"
    }
}
