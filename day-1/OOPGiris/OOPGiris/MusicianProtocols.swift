//
//  MusicianProtocols.swift
//  OOPGiris
//
//  Created by Şule Kaptan on 21.10.2023.
//

import Foundation

protocol SarkiSoyleme {
    func sarkiSoyle()
    func gitarCal()
    var degisken : String {get}
}

class Sarkici : SarkiSoyleme {
    func sarkiSoyle() {
        print("Sarki söyle")
    }
    
    func gitarCal() {
        print("Gitar cal")
    }
    
    var degisken: String = "degisken"
}
