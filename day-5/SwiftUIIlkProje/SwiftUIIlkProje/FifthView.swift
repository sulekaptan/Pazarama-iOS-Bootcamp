//
//  FifthView.swift
//  SwiftUIIlkProje
//
//  Created by Şule Kaptan on 27.10.2023.
//

import SwiftUI

struct FifthView: View {
    
    //state variable birden fazla durumda kullanılabilir.
    @State var name = "Şule"
    
    var body: some View {
        VStack{
            Text(name)
                .font(.largeTitle)
                .padding()
            
            //$ ile binding yapabiliriz
            //binding: karşılıklı birbirini etkiler
            TextField("Enter your name", text: $name )
            
            Button("Değiştir"){
                self.name = "Değiştirildi."
            }
        }
        
    }
}

struct FifthView_Previews: PreviewProvider {
    static var previews: some View {
        FifthView()
    }
}
