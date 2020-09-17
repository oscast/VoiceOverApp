//
//  CategoryTableViewCell.swift
//  VoiceOverApp
//
//  Created by Oscar Castillo on 9/14/20.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryImageView: UIImageView!
    
    func setup(with category: Category) {
        categoryLabel.text = category.name
        let imageName = category == .technology ? "Tech": category.name
        let image = UIImage(named: imageName)
        categoryImageView.image = image
        self.isAccessibilityElement = false

        makeItAccesible(with: category)
    }
    
    func makeItAccesible(with category: Category) {
        categoryLabel.isAccessibilityElement = true
        categoryLabel.accessibilityTraits = .staticText
        categoryLabel.accessibilityLabel = category.name
        categoryLabel.accessibilityHint = "Toque dos veces para escuchar noticias de esta categoría."
    }
}
