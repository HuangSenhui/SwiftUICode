//
//  HomeView.swift
//  SwiftUICode
//
//  Created by HuangSenhui on 2020/5/5.
//  Copyright © 2020 H.Senhui. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State var isShowUpdates = false
    @Binding var isShowProfile: Bool
    @Binding var isShowContentView: Bool
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Hello, SwiftUI!")
                        .font(.system(size: 20, weight: .bold))
                    
                    Spacer()
                    AvatarView(isShowProfile: $isShowProfile)
                    
                    Button(action: {
                        self.isShowUpdates.toggle()
                    }) {
                        Image(systemName: "bell")
                            .renderingMode(.original)
                            .font(.system(size: 16, weight: .medium))
                            .frame(width: 36, height: 36)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                    }
                    .sheet(isPresented: $isShowUpdates) {
                        UpdateList()
                    }
                }
                .padding(.horizontal)
                .padding(.leading, 14)
                .padding(.top, 30)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    WatchRingView()
                        .padding(.horizontal, 30)
                        .padding(.bottom, 30)
                        .onTapGesture {
                            
                    }
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20.0) {
                        ForEach(sectionData) { item in
                            GeometryReader { geometry in
                                SectionView(section: item)
                                    .rotation3DEffect(
                                        Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / 20),axis: (x: 0, y: -10, z: 0)
                                )

                            }
                            .frame(width: 275, height: 275)
                        }
                    }
                    .padding(30)
                    .padding(.bottom, 30)
                }
                .offset(y: -30)
                
                // other section
                HStack {
                    Text("其它")
                        .font(.title).bold()
                    
                    Spacer()
                }
                .padding(.leading, 30)
                .offset(y: -60)
                
                SectionView(section: sectionData[1], width: MAINSCREEN.width - 60, height: 275)
                    .offset(y: -60)
                
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(isShowProfile: .constant(false), isShowContentView: .constant(false))
    }
}

struct SectionView: View {
    var section: Section
    var width: CGFloat = 275
    var height: CGFloat = 275
    
    var body: some View {
        VStack {
            HStack {
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color.white)
                    .frame(width: 160, alignment: .leading)
                Spacer()
                Image(section.logo)
                    .resizable()
                    .frame(width: 36, height: 36)
                    .clipShape(Circle())
            }
            
            Text(section.text)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: width, height: height)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

struct Section: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    var image: Image    // ? image : url
    var color: Color
}


let sectionData = [
    Section(title: "Design in SwiftUI", text: "40 小节课程", logo: "swiftui_logo", image: Image("huoying_post1"), color: Color.red),
    Section(title: "Design in SwiftUI", text: "30 小节课程", logo: "swiftui_logo", image: Image("huoying_post1"), color: Color.green),
    Section(title: "Design in SwiftUI", text: "20 小节课程", logo: "swiftui_logo", image: Image("huoying_post1"), color: Color.blue),
    Section(title: "Design in SwiftUI", text: "10 小节课程", logo: "swiftui_logo", image: Image("huoying_post1"), color: Color.purple),
    Section(title: "Design in SwiftUI", text: "5 小节课程", logo: "swiftui_logo", image: Image("huoying_post1"), color: Color.gray),
    
]

struct WatchRingView: View {
    var body: some View {
        HStack(spacing: 30.0) {
            HStack(spacing: 12.0) {
                RingView(color1: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), color2: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), width: 44, height: 44, percent: 66, isShow: .constant(true))
                VStack(alignment: .leading, spacing: 4.0) {
                    Text("5分钟前 更新")
                        .bold()
                        .modifier(FontModifier(style: .subheadline))
                    Text("上次学习 是: 5月5号")
                        .modifier(FontModifier(style: .caption))
                }
                .modifier(FontModifier())
                
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
            
            HStack(spacing: 12.0) {
                RingView(color1: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), color2: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), width: 32, height: 32, percent: 90, isShow: .constant(true))
                
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
            
            HStack(spacing: 12.0) {
                RingView(color1: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), color2: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), width: 32, height: 32, percent: 70, isShow: .constant(true))
                
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
        }
    }
}
