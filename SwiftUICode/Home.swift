//
//  Home.swift
//  SwiftUICode
//
//  Created by HuangSenhui on 2020/5/5.
//  Copyright © 2020 H.Senhui. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    @State var isShowProfile = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        // 使用ZStack,将不同试图层叠组合，方便后续动画
        ZStack {
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            HomeView(isShowProfile: $isShowProfile)
                .padding(.top, 44)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                .offset(y: isShowProfile ? -450 : 0)
                .rotation3DEffect(
                    Angle(degrees: isShowProfile ? Double(viewState.height / 10) + 10 : 0),
                    axis: (x: -10.0, y: 0, z: 0))
                .scaleEffect(isShowProfile ? 0.9 : 1)
                .animation(.spring(
                    response: 0.5,
                    dampingFraction: 0.6,
                    blendDuration: 0))
                .edgesIgnoringSafeArea(.all)
            
            MenuView()
                .background(Color.black.opacity(0.001))   // 用于添加手势
                .offset(y: isShowProfile ? 0 : MAINSCREEN.height)
                .animation(.spring(
                    response: 0.5,
                    dampingFraction: 0.6,
                    blendDuration: 0)
            )
            .gesture(
                DragGesture().onChanged { value in
                    self.viewState = value.translation
                }
                .onEnded { value in
                    if self.viewState.height > 50 {
                        self.isShowProfile = false
                    }
                    
                    self.viewState.height = .zero
                }
            )
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct AvatarView: View {
    @Binding var isShowProfile: Bool
    
    var body: some View {
        Button(action: {
            self.isShowProfile.toggle()
        }) {
            Image("swiftui_logo")
                .renderingMode(.original)
                .resizable()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
        }
    }
}

let MAINSCREEN = UIScreen.main.bounds
