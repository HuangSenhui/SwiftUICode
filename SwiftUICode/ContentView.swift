//
//  ContentView.swift
//  SwiftUICode
//
//  Created by HuangSenhui on 2020/5/4.
//  Copyright © 2020 H.Senhui. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var isShowCard = false
    @State var viewState = CGSize.zero
    @State var isShowBottomCard = false
    @State var bottomState = CGSize.zero
    @State var isShowFull = false
    
    var body: some View {
        ZStack {
            
            TitleView()
                .blur(radius: isShowCard ? 20 : 0)
                .opacity(isShowBottomCard ? 0.4 : 1)
                .offset(y: isShowBottomCard ? -200 : 0)
                .animation(
                    Animation
                        .default
                        .delay(0.1)
                        .speed(2)   // 速度、重复
            )
            
            BackCardView()
                .frame(width: isShowBottomCard ? 300 : 340, height: 220)
                .background(Color.red)
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: isShowCard ? -400 : -40)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: isShowBottomCard ? -180 : 0)
                .scaleEffect(isShowBottomCard ? 1 : 0.9)
                .rotationEffect(Angle(degrees: isShowCard ? 0 : 10))  // 旋转
                .rotationEffect(Angle(degrees: isShowBottomCard ? -10 : 0))
                .rotation3DEffect(Angle(degrees: isShowBottomCard ? 0 : 10), axis: (x: 10.0, y: 0.0, z: 0.0))  // 3D
                .blendMode(.hardLight)
                .animation(.easeIn(duration: 0.5))

            BackCardView()
                .frame(width: 340, height: 220)
                .background(Color.blue)
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: isShowCard ? -200 : -20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: isShowBottomCard ? -140 : 0)
                .scaleEffect(isShowBottomCard ? 1 : 0.95)
                .rotationEffect(Angle(degrees: isShowCard ? 0 : 5))
                .rotationEffect(Angle(degrees: isShowBottomCard ? -5 : 0))
                .rotation3DEffect(Angle(degrees: isShowBottomCard ? 0 : 5), axis: (x: 10.0, y: 0.0, z: 0.0))
                .blendMode(.hardLight)
                .animation(.easeIn(duration: 0.3))

            CardView()
                .frame(width: isShowBottomCard ? 375 : 340, height: 220)
                .background(Color.black)
//                .cornerRadius(20)
                .clipShape(RoundedRectangle(cornerRadius: isShowBottomCard ? 30 : 20, style: .continuous))
                .shadow(radius: 20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: isShowBottomCard ? -100 : 0)
                .blendMode(.hardLight)
                .animation(.spring(
                    response: 0.1,
                    dampingFraction: 0.6,
                    blendDuration: 0))
                .onTapGesture {
                    self.isShowBottomCard.toggle()
            }
            .gesture(
                DragGesture().onChanged { value in
                    self.viewState = value.translation
                    self.isShowCard = true
                }
                .onEnded { value in
                    self.viewState = .zero
                    self.isShowCard = false
                }
            )
            // 显示拖拽偏移数据
//            Text("\(bottomState.height)").offset(y:-300)
            
            BottomCardView(isShow: $isShowBottomCard)
                .offset(x:0, y: isShowBottomCard ? 360 : 1000)
                .offset(y: bottomState.height)
                .blur(radius: isShowCard ? 20 : 0)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))   // 时间曲线
                .gesture(
                    // 分段滑动
                    DragGesture().onChanged { value in
                        self.bottomState = value.translation
                        if self.isShowFull {
                            self.bottomState.height += -300
                        }
                        if self.bottomState.height < -300 {
                            self.bottomState.height = -300  // 处理视图边框
                        }
                    }
                    .onEnded { value in
                        if self.bottomState.height > 50 {
                            self.isShowBottomCard = false
                        }
                        if (self.bottomState.height < -100 && !self.isShowFull) ||
                        (self.bottomState.height < -250 && self.isShowFull) {
                            self.bottomState.height = -300
                            self.isShowFull = true
                        } else {
                            self.bottomState = .zero
                            self.isShowFull = false
                        }
                        
                    }
            )
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// 将模块导出，将需要做动画的modifier放到主View

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
            Image("huoying_post1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 130, alignment: .top)
        }
        
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }

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
            Image("huoying_post1")
                .resizable()
                .frame(width: 370, height: 200)
            
            Spacer()
        }
    }
}

struct BottomCardView: View {
    @Binding var isShow: Bool
    
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
            
            HStack(spacing: 20.0) {
                RingView(color1: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1),
                         color2: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1),
                         width: 88,
                         height: 88,
                         percent: 80,
                         isShow: $isShow)
                    .animation(Animation.easeInOut.delay(0.3))
                
                VStack(alignment: .leading, spacing: 8.0) {
                    Text("SwiftUI")
                        .fontWeight(.bold)
                    Text("SwiftUI 修炼进度：布局、动画、数据流...")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .lineSpacing(4)
                    
                }
                .padding(20)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 10)
            }
            
            
            Spacer()
            
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
            .frame(maxWidth: .infinity) // 与屏幕等宽
            .background(Color.white)
            .cornerRadius(30)
            .shadow(radius: 20)
    }
}
