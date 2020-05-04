//
//  ContentView.swift
//  SwiftUICode
//
//  Created by HuangSenhui on 2020/5/4.
//  Copyright © 2020 H.Senhui. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            TitleView()
                .blur(radius: 20)
            
            BackCardView()
                .background(Color.red)
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: -40)
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: 10))  // 旋转
                .rotation3DEffect(Angle(degrees: 10), axis: (x: 10.0, y: 0.0, z: 0.0))  // 3D
                .blendMode(.hardLight)

            BackCardView()
                .background(Color.blue)
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: -20)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: 5))
                .rotation3DEffect(Angle(degrees: 5), axis: (x: 10.0, y: 0.0, z: 0.0))
                .blendMode(.hardLight)

            CardView()
                .blendMode(.hardLight)
            
            BottomCardView()
                .blur(radius: 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("UI Design")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                    Text("SwiftUI 教程")
                        .foregroundColor(Color.gray)
                }
                Spacer()
                Image("swiftui_logo")
                    .resizable()
                    .frame(width:36, height: 36)
                    .cornerRadius(18)
                
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            Spacer()
            Image("post_1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 130, alignment: .top)
        }
        .frame(width: 340, height: 220)
        .background(Color.black)
        .cornerRadius(20)
        .shadow(radius: 20)
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(width: 340, height: 220)
        
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("凭证")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                Spacer()
            }
            Image("post_1")
                .resizable()
                .frame(width: 370, height: 200)
            
            Spacer()
        }
    }
}

struct BottomCardView: View {
    var body: some View {
        VStack(spacing: 20.0) {
            Rectangle()
                .frame(width: 40, height: 6)
                .cornerRadius(3)
                .opacity(0.1)
            
            Text("这是一个信息面板，介绍凭证。这是一个信息面板，介绍凭证。这是一个信息面板，介绍凭证。这是一个信息面板，介绍凭证")
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .font(.subheadline)
            Spacer()
            
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
            .frame(maxWidth: .infinity) // 与屏幕等宽
            .background(Color.white)
            .cornerRadius(30)
            .shadow(radius: 20)
            .offset(x:0, y: 500)
    }
}
