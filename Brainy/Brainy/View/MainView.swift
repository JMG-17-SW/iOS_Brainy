//
//  MainView.swift
//  Brainy
//
//  Created by 김경호 on 2023/05/03.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack{
            Text("BRAINY")
                .font(.custom("Bangers-Regular", size: 30))
                .foregroundColor(Color("MainColor"))
                .padding()
            
            Text("NEW PROJECT")
                .frame(width: 300, alignment: .leading)
                .font(.custom("Bangers-Regular", size: 20))
                .foregroundColor(.orange)
                .padding()
            
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color("MainColor"), lineWidth: 10)
                .frame(width: 300, height: 200)
                .overlay {
                    LinearGradient(colors: [Color("HotPink"), Color("MainColor")], startPoint: .top, endPoint: .bottom)
                        .mask(Image(systemName: "plus.app").resizable().frame(width: 50, height: 50))
                }
            
            Text("PROJECT FILES")
                .frame(width: 300, alignment: .leading)
                .font(.custom("Bangers-Regular", size: 20))
                .foregroundColor(.orange)
                .padding()
            
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
