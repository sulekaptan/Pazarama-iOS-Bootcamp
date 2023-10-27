//
//  FourthView.swift
//  SwiftUIIlkProje
//
//  Created by Şule Kaptan on 27.10.2023.
//

import SwiftUI

struct FourthView: View {
    
    @State var name = "Şule"
    
    //body'in bağımlı olduğu bir durum varsa (list,değişken vs) her seferinde render edilir ve bu istenen bir durum değildir.
    //burda state management devreye girer. @State
    var body: some View {
        VStack{
            Text(name)
                .font(.title)
                .bold()
                .padding()
            
            Button("Değiştir") {
                self.name = "Şule Kaptan"
            }
        }
    }
}

struct FourthView_Previews: PreviewProvider {
    static var previews: some View {
        FourthView()
    }
}
