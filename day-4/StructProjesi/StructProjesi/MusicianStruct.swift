//
//  MusicianStruct.swift
//  StructProjesi
//
//  Created by Şule Kaptan on 21.10.2023.
//

import Foundation

struct MusicianStruct {
    var name : String
    var age : Int
    var instrument : String
    
    //free initialization
    
    mutating func happyBirthday() {
        self.age += 1 //immutable olduğu için self'i değiştirmene izin vermez. "mutating" kullanılmalıdır.
    }
}
