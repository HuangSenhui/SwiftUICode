//
//  Buttons.swift
//  SwiftUICode
//
//  Created by HuangSenhui on 2020/7/22.
//  Copyright © 2020 H.Senhui. All rights reserved.
//

import SwiftUI

struct Buttons: View {
    
    @State private var tap = false
    @State private var press = false
    
    var body: some View {
                
        VStack(spacing: 50.0) {
            RectangleButton()
            
            
            CircleButton()
            
        }
        .frame(maxWidth:.infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.7889582515, green: 0.9017089009, blue: 1, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
        .animation(.spring())
        
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons()
    }
}

struct RectangleButton: View {
    
    @State private var tap = false
    @State private var press = false
    
    var body: some View {
        Text("Button")
            .font(.system(size: 20, weight: .semibold, design: .rounded))
            .frame(width: 200, height: 60, alignment: .center)
            .background(
                // 内阴影
                ZStack {
                    Color(press ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
                    
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .foregroundColor(Color(press ? #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .blur(radius: 4)
                        .offset(x: -8, y: -8)
                    
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                        .padding(2)
                        .blur(radius: 2)
                }
        )
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .overlay(
                HStack {
                    Image(systemName: "person.crop.circle")
                        .font(.system(size: 24, weight: .light))
                        .foregroundColor(Color.white.opacity(press ? 0 : 1))
                        .frame(width: press ? 64 : 54, height: press ? 4 : 50)
                        .background(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.3), radius: 10, x: 10, y: 10)
                        .offset(x: press ? 70 : -10, y: press ? 16 : 0)
                    
                    Spacer()
                }
        )
            .shadow(color: Color(press ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)), radius: 20, x: 20, y: 20)
            .shadow(color: Color(press ? #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -20, y: -20)
            .scaleEffect(tap ? 1.3 : 1.0)
            .gesture(
                LongPressGesture(minimumDuration: 0.5, maximumDistance: 2)
                    .onChanged { value in
                        self.tap = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            self.tap = false
                        }
                }
                .onEnded { value in
                    self.press.toggle()
                }
        )
    }
}

struct CircleButton: View {
    
    @State private var tap = false
    @State private var press = false
    
    var body: some View {
        ZStack() {
            Image(systemName: "sun.max")
                .font(.system(size: 44, weight: .light))
                .offset(x: press ? -90 : 0, y: press ? -90 : 0)
                .rotation3DEffect(Angle(degrees: press ? 20 : 0), axis: (x: 10, y: -10, z: 0))
            
            Image(systemName: "moon")
                .font(.system(size: 44, weight: .light))
                .offset(x: press ? 0 : 90, y: press ? 0 : 90)
                .rotation3DEffect(Angle(degrees: press ? 0 : 20), axis: (x: -10, y: 10, z: 0))
        }
        .frame(width: 100.0, height: 100.0)
        .background(
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(press ? #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), Color(press ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                
                Circle()
                    .stroke(Color.clear, lineWidth: 10)
                    .shadow(color: Color(press ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)), radius: 3, x: -5, y: -5)
                
                Circle()
                    .stroke(Color.clear, lineWidth: 10)
                    .shadow(color: Color(press ? #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), radius: 3, x: 3, y: 3)
            }
        )
            .clipShape(Circle())
            .shadow(color: Color(press ? #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), radius: 20, x: -20, y: -20)
            .shadow(color: Color(press ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)), radius: 20, x: 20, y: 20)
            .scaleEffect(tap ? 1.2 : 1.0)
        .gesture(
            LongPressGesture()
                .onChanged({ value in
                    self.tap = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        self.tap = false
                    }
                })
                .onEnded({ value in
                    self.press.toggle()
                })
        )
    }
}
