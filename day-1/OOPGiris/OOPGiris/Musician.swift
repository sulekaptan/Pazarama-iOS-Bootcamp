//
//  Musician.swift
//  OOPGiris
//
//  Created by Şule Kaptan on 20.10.2023.
//

import Foundation

enum MusicianType {
    case Baterist
    case Gitarist
}

class Musician {
    var name: String
    var age: Int
    var instrument: String
    var musicianType: MusicianType
    
    init(name: String, age: Int, instrument: String, musicianType: MusicianType) {
        self.name = name
        self.age = age
        self.instrument = instrument
        self.musicianType = musicianType
    }
    
    func ornekFonksiyon(){
        print("örnek fonksiyon çağırıldı.")
    }
    
    private func privateOrnek(){
        print("private çağırıldı.")
    }
    
    func toplama(x: Int, y: Int){
        print(x + y)
    }
    
    func toplama(x: Int, y: Int, z: Int){
        print(x + y + z)
    }
}
