//
//  MenuView.swift
//  SwiftUICode
//
//  Created by HuangSenhui on 2020/5/5.
//  Copyright © 2020 H.Senhui. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    
    var progress = 60
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                Text("进度条：完成 \(progress)%")
                    .font(.caption)
                
                // Color 也是一个View
                Color.white
                    .frame(width: CGFloat(Double(progress) * 1.3), height: 6)
                    .cornerRadius(3)    // 进度指示器
                    .frame(width: 130, height: 6, alignment: .leading)
                    .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.08))
                    .cornerRadius(3)
                    .padding()  // 进度条
                    .frame(width: 150, height: 24)
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(12)   // 背景
                
                MenuItem(title: "账号设置", icon: "gear")
                MenuItem(title: "账户信息", icon: "creditcard")
                MenuItem(title: "退出登录", icon: "person.crop.circle")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(BlurView(style: .systemThinMaterial))
//            .background(LinearGradient(
//                gradient: Gradient(colors: [Color(.systemGray6), Color(.systemGray4)]),
//                startPoint: .top,
//                endPoint: .bottom)
//            )
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .padding(.horizontal, 30)
            .overlay(
                Image("swiftui_logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .offset(y: -150)
            )
        }
        .padding(.bottom, 30)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct MenuItem: View {
    var title: String
    var icon: String
    
    var body: some View {
        HStack(spacing: 16.0) {
            Image(systemName: icon)
                .font(.system(size: 20, weight: .light))
                .imageScale(.large)
                .frame(width: 32, height: 32)
                .foregroundColor(Color(#colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 1)))
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .rounded)) // SF-Symbols
                .frame(width: 88)
        }
    }
}
