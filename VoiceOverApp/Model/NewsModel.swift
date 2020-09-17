//
//  NewsModel.swift
//  AccessibilityNews
//
//  Created by Oscar Castillo on 9/14/20.
//

import Foundation

struct NewsModel: Decodable {
    let category: String
    let newsTitle: String
    let newsInformation: String
    let image: String
    let newsDate: String
    let likes: Int
    let accesibilityInfo: AccesibilityInfo
}

struct AccesibilityInfo: Decodable {
    let category: String
    let newsTitle: String
    let newsInformation: String
    let imageDescription: String
    let newsDate: String
}
