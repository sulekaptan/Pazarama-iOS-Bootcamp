//
//  Crypto.swift
//  CryptoSwiftUI
//
//  Created by Şule Kaptan on 27.10.2023.
//

import Foundation

struct Crypto : Decodable, Identifiable, Hashable{
    let id = UUID()
    let currency:String
    let price:String
}

//örn, id'nin ids gibi geldiği durumlarda kullanılır.
private enum CodingKeys : String, CodingKey{
    case currency = "currency"
    case price = "price"
}

