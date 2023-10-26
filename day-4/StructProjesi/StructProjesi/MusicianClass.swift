//
//  MusicianClass.swift
//  StructProjesi
//
//  Created by Şule Kaptan on 21.10.2023.
//

import Foundation

class MusicianClass {
    var name : String
    var age : Int
    var instrument : String
    
    init(name: String, age: Int, instrument: String) {
        self.name = name
        self.age = age
        self.instrument = instrument
    }
    
    func happyBirthday() {
        self.age += 1
    }
}
