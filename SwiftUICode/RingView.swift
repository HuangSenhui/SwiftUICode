//
//  RingView.swift
//  SwiftUICode
//
//  Created by HuangSenhui on 2020/5/5.
//  Copyright © 2020 H.Senhui. All rights reserved.
//

import SwiftUI

struct RingView: View {
    var color1 = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    var color2 = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
    var width: CGFloat = 44
    var height: CGFloat = 44
    var percent: CGFloat = 88
    
    @Binding var isShow: Bool
    
    var body: some View {
        let multiplier = width / 44
        let progrees = 1 - percent / 100
        
        return ZStack {
            Circle()
                .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 5 * multiplier))
                .frame(width: width, height: height)
            
            Circle()
                .trim(from: isShow ? progrees : 1, to: 1) // 0.2  -> 80%
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: [Color(color1), Color(color2)]),
                        startPoint: .topTrailing,
                        endPoint: .bottomLeading),
                    style: StrokeStyle(
                        lineWidth: 5 * multiplier,
                        lineCap: .round,
                        lineJoin: .round,
                        miterLimit: .infinity,
                        dash: [20,0],
                        dashPhase: 0))
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                .frame(width: width, height: height)
                .shadow(color: Color(color2).opacity(0.1), radius: 3 * multiplier, x: 0, y: 3 * multiplier)
//                .animation(.easeInOut)    // 子视图的动画优先级高于父视图
            
            Text("\(Int(percent))%")
                .font(.system(size: 14 * multiplier))
                .fontWeight(.bold)
                .onTapGesture {
                    self.isShow.toggle()
            }
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(isShow: .constant(true))
    }
}
