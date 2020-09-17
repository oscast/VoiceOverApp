//
//  Categorie.swift
//  VoiceOverApp
//
//  Created by Oscar Castillo on 9/14/20.
//

import Foundation

enum Category: Int, CaseIterable {
    
    case technology
    case science
    case international
    case sports
    case health
    case business
    
    var name: String {
        switch self {
        case .technology:
            return "Tecnología"
        case .science:
            return "Ciencia"
        case .international:
            return "Internacionales"
        case .sports:
            return "Deportes"
        case .health:
            return "Salud"
        case .business:
            return "Negocios"
        }
    }
}
