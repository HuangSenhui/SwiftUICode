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
    @State var isShowContentView = false
    
    var body: some View {
        // 使用ZStack,将不同试图层叠组合，方便后续动画
        ZStack {
            // 第一层
            Color("background1")
                .edgesIgnoringSafeArea(.all)
            
            // 第二层
            HomeView(isShowProfile: $isShowProfile, isShowContentView: $isShowContentView)
                .padding(.top, 44)
                .background(
                    VStack {
                        LinearGradient(gradient: Gradient(colors: [Color("background1"), Color("background1")]), startPoint: .top, endPoint: .bottom)
                            .frame(height: 200)
                        Spacer()
                    }
                    .background(Color("background1"))
                )
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                .offset(y: isShowProfile ? -450 : 0)
                .rotation3DEffect(
                    Angle(
                        degrees: isShowProfile ? -Double(viewState.height / 10) + 10 : 0),
                        axis: (x: -10.0, y: 0, z: 0),
                        anchor: .top    // 轴
                )
                .scaleEffect(isShowProfile ? 0.9 : 1)
                .animation(.spring(
                    response: 0.5,
                    dampingFraction: 0.6,
                    blendDuration: 0))
                .edgesIgnoringSafeArea(.all)
            
            // 第三层
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
            
            // contentView
            if isShowContentView {
                BlurView(style: .systemMaterial).edgesIgnoringSafeArea(.all) // 消除背景
                
                ContentView()
                
                HStack {
                    Spacer()
                    VStack {
                        Image(systemName: "xmark")
                            .frame(width: 36, height: 36)
                            .foregroundColor(.white)
                            .background(Color.black)
                            .clipShape(Circle())
                        
                        Spacer()
                    }
                }
                .offset(x: -16, y: 16)
                .transition(.move(edge: .top))
                .animation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 0))
                .onTapGesture {
                    self.isShowContentView = false
                }
            }
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home().environment(\.colorScheme, .dark)
            .environment(\.sizeCategory, .extraLarge)
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
