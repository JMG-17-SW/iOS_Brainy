//
//  MainView.swift
//  Brainy
//
//  Created by 김경호 on 2023/05/03.
//

import SwiftUI

struct MainView: View {
    @State private var item = ["test1", "test2", "test3", "test4"]
    
    var body: some View {
        VStack{
            VStack{
                Text("BRAINY")
                    .font(.custom("Bangers-Regular", size: 30))
                    .foregroundColor(Color("MainColor"))
                    .padding()
            }
            
            VStack{
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
            }
            
            VStack{
                Text("PROJECT FILES")
                    .frame(width: 300, alignment: .leading)
                    .font(.custom("Bangers-Regular", size: 20))
                    .foregroundColor(.orange)
                    .padding()
                
                ScrollView(.horizontal) {
                    HStack(spacing: 15) {
                        ForEach(0..<item.count) {
                            CardView(title: self.$item[$0])
                        }
                    }.padding()
                    
                }
            }
            
        }
    }
}
extension MainView{
    struct CardView: View {
        @Binding var title: String

        var body: some View {
            VStack{
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color("MainColor"))
                    .overlay {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.white)
                            .frame(width: 100, height: 100)
                            .padding(.bottom, 60)
                    }
            }
            .frame(width: 150, height: 200)
//            ZStack {
//                Color.white
//                    .cornerRadius(8)
//                Text(title)
//            }
//            .frame(width: 150, height: 200)
//            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 0)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
