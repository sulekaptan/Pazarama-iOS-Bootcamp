//
//  Crypto.swift
//  KriptoParaUygulamasi
//
//  Created by Şule Kaptan on 21.10.2023.
//

import Foundation

struct Crypto : Decodable{ //decode edilebilir demek. encodable, codable
    let currency:String
    let price:String
}


//bunu chatgpt veya quicktype.io'dan kolaylıkla çeviirebiliriz.
/*
struct User {
    let id:Int
    let name:String
    let username:String? //nil gelebilecek durumlarda optional olabilir.
    let email:String
    let address:Address
    let phone:String
    let website:String?
    let company:Company
}

struct Address {
    let street:String
    let suite:String
    let city:String
    let zipcode:String
    let geo:Geo
}

struct Company{
    let name:String
    let catchPhrase:String
    let bs:String
}


struct Geo{
    let lat:String
    let lng:String
}

*/
