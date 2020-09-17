//
//  NewsDetailTitleTableViewCell.swift
//  VoiceOverApp
//
//  Created by Oscar Castillo on 9/16/20.
//

import UIKit

class NewsDetailTitleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func setup(with news: NewsModel) {
        titleLabel.text = news.newsTitle
    }
}
