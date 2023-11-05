//
//  FontManager.swift
//  Pokemon
//
//  Created by Samet TIG on 4.11.2023.
//

import UIKit

class FontManager {
    
    static let shared = FontManager()
    
    private init() {}
    
    func regularFont(size: CGFloat) -> UIFont {
        return UIFont(name: "Poppins-Regular", size: size)!
    }
    
    func boldFont(size:CGFloat) -> UIFont {
        return UIFont(name: "Poppins-Bold", size: size)!
    }
    
}
