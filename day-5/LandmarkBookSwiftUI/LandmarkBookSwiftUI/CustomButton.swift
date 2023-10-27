//
//  CustomButton.swift
//  LandmarkBookSwiftUI
//
//  Created by Şule Kaptan on 27.10.2023.
//

import SwiftUI

struct CustomButton: View {
    
    @Binding var seen : Bool
    
    var body: some View {
        Button(action: {
            self.seen.toggle()
        }, label: {
            Text("Değiştir.")
        }).padding()
        .font(.title)
    }
}

