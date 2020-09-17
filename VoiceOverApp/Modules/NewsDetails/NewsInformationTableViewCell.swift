//
//  NewsInformationTableViewCell.swift
//  AccessibilityNews
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
    }
}
