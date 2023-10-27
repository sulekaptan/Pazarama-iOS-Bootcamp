//
//  ThirdView.swift
//  SwiftUIIlkProje
//
//  Created by Şule Kaptan on 27.10.2023.
//

import SwiftUI

struct ThirdView: View {
    var body: some View {
        VStack{
            //hashable ya da identifiable olması lazım!
            //List(userList, id: \.self) { user in -> hashable
                
            List(userList, id: \.self) { user in
                HStack{
                    Image("turkish")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                    Text(user.name)
                }
            }
            
            List(userList) { user in
                Text(user.name)
            }
            
            List{
                ForEach(userList){ user in
                    Text(user.name)
                }
            }
        }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}
