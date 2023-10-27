//
//  Landmark.swift
//  LandmarkBookSwiftUI
//
//  Created by Şule Kaptan on 27.10.2023.
//

import Foundation

struct Landmark : Identifiable {
    let id = UUID()
    let name:String
    let image:String
    let country:String
    let year:String
}

let collesium = Landmark(name: "Colosseum", image: "colosseum", country: "Rome", year: "72")
let londonBridge = Landmark(name: "London Bridge", image: "londonbridge", country: "England", year: "1834")
let pisa = Landmark(name: "Pisa Tower", image: "pisa", country: "Italy", year: "1063")
let cathedral = Landmark(name: "Catedral de Santiago de Compostela", image: "cathedral", country: "Spain", year: "1731")
let parcguell = Landmark(name: "Parc Güell", image: "parcguell", country: "Spain", year: "1914")
let ayasofya = Landmark(name: "Ayasofya Camii", image: "ayasofya", country: "Turkey", year: "537")

let landmarkArray = [cathedral, collesium, parcguell, londonBridge, pisa, ayasofya]
