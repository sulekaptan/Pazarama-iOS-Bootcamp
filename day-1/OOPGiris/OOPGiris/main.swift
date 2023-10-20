//
//  main.swift
//  OOPGiris
//
//  Created by Şule Kaptan on 20.10.2023.
//

import Foundation

// Inheritance, Encapsulation, Abstraction, Polymorphism

var musician = Musician(name: "Şule", age: 23, instrument: "Guitar", musicianType: .Baterist)

print(musician.instrument)
musician.ornekFonksiyon()

musician.toplama(x: 2, y: 3)
musician.toplama(x: 2, y: 3, z: 4)

var superMusician = SuperMusician(name: "Super Şule", age: 64, instrument: "Bateri", musicianType: .Baterist)

superMusician.ornekFonksiyon()
superMusician.superFonksiyon()
