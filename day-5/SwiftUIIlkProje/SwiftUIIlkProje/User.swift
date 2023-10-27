//
//  User.swift
//  SwiftUIIlkProje
//
//  Created by Şule Kaptan on 27.10.2023.
//

import Foundation

//hashable ya da identifiable olması lazım!
struct User: Identifiable, Hashable{
    
    let id = UUID()
    let name:String
}

let sule = User(name: "Şule")
let serdar = User(name: "Serdar")
let sevval = User(name: "Şevval")
let eren = User(name: "Eren")

let userList = [sule, serdar, serdar, eren]
