//
//  OrnekView.swift
//  LandmarkBookSwiftUI
//
//  Created by Şule Kaptan on 27.10.2023.
//

import SwiftUI

struct OrnekView: View {
    @State var seen = false
    
    var body: some View {
        VStack{
            Text(self.seen ? "Görüldü." : "Görülmedi")
            
            CustomButton(seen: $seen)
        }
    }
}

struct OrnekView_Previews: PreviewProvider {
    static var previews: some View {
        OrnekView()
    }
}
