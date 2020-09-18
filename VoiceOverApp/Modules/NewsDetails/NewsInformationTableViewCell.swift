//
//  NewsInformationTableViewCell.swift
//  VoiceOverApp
//
//  Created by Oscar Castillo on 9/16/20.
//

import UIKit

class NewsInformationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var informationLabel: UILabel!
    
    func setup(with news: NewsModel) {
        dateLabel.text = news.newsDate
        informationLabel.text = news.newsInformation
        makeGroupAccessible(with: news)
    }
    
    func makeItAccessible(with news: NewsModel) {
        dateLabel.isAccessibilityElement = true
        dateLabel.accessibilityTraits = .staticText
        dateLabel.accessibilityLabel = news.accesibilityInfo.newsDate
        
        informationLabel.isAccessibilityElement = true
        informationLabel.accessibilityTraits = .staticText
        informationLabel.accessibilityLabel = news.accesibilityInfo.newsInformation
    }
    
    func makeGroupAccessible(with news: NewsModel) {
        dateLabel.isAccessibilityElement = false
        
        informationLabel.isAccessibilityElement = true
        informationLabel.accessibilityTraits = .staticText
        informationLabel.accessibilityLabel = news.accesibilityInfo.newsInformation
    }
}
