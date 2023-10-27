//
//  ToggleView.swift
//  LandmarkBookSwiftUI
//
//  Created by Şule Kaptan on 27.10.2023.
//

import SwiftUI

struct ToggleView: View {
    
    @State var shown = false
    
    var body: some View {
        Text("Hello, world!")
        
        Button("Ekranı aç.") {
            self.shown.toggle()
        }.sheet(isPresented: $shown) {
            DetailView(selectedLandmark: pisa)
        }
    }
}

struct ToggleView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleView()
    }
}
