//
//  Simpson.swift
//  LayoutProjesi
//
//  Created by Şule Kaptan on 21.10.2023.
//

import Foundation
import UIKit

class Simpson {
    
    var name : String
    var job : String
    var image : UIImage
    
    init(simpsonName: String, simpsonJob:String,simpsonImage:UIImage) {
        name = simpsonName
        job = simpsonJob
        image = simpsonImage
    }
}

class SelectedSimpson {
    static let shared = SelectedSimpson()
    var selected : Simpson?
    private init() {}
}
