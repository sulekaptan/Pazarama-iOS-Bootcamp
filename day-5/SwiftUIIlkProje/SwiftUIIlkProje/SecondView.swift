//
//  SecondView.swift
//  SwiftUIIlkProje
//
//  Created by Şule Kaptan on 27.10.2023.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        Image("turkish")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.4)
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
