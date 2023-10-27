//
//  ContentView.swift
//  SwiftUIIlkProje
//
//  Created by Şule Kaptan on 27.10.2023.
//

import SwiftUI

struct ContentView: View {
    //body: tasarımın durduğu görünüm.
    var body: some View {
        //hstack-vstack-zstack
        VStack {
            SecondView()
            Spacer()
            Text("Hello, world!")
                .padding()
            
            Text("Hello SwiftUI")
                //bu özelliklerin sıralaması önemlidir!!
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .frame(width: 300, height: 100, alignment: .trailing)
            
            
            Spacer()
            Text("Hello SwiftUI")
                .padding()
            Text("Hello SwiftUI")
            Spacer()
            
            //resizable ve aspectRatio yapmazsak istediğimiz gibi konumlandıramayabiliriz.
            SecondView()
            
        }.background(Color.white)
        

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
