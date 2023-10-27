//
//  DetailView.swift
//  LandmarkBookSwiftUI
//
//  Created by Şule Kaptan on 27.10.2023.
//

import SwiftUI

struct DetailView: View {
    
    let selectedLandmark : Landmark
    
    var body: some View {
        VStack{
            Image(selectedLandmark.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 250)
                .padding()
            
            Text(selectedLandmark.name)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.pink)
                .padding()
            
            Text(selectedLandmark.country)
                .font(.title2)
                .bold()
                .padding()
            
            Text(selectedLandmark.year)
                .font(.title3)
                .bold()
                .padding()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(selectedLandmark: pisa)
    }
}
