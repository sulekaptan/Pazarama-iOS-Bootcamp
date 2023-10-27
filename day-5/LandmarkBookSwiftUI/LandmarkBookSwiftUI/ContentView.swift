//
//  ContentView.swift
//  LandmarkBookSwiftUI
//
//  Created by Şule Kaptan on 27.10.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack {
                
                List(landmarkArray){ landmark in
                    NavigationLink {
                        DetailView(selectedLandmark: landmark)
                    } label: {
                        HStack{
                            Image(landmark.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 50)
                            Text(landmark.name)
                                .font(.title3)
                        }
                    }

                    
                    
                }
                
            }.navigationTitle("Landmark Book")
            .foregroundColor(.blue)
            
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
