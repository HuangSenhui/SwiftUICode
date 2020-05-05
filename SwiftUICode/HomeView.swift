//
//  HomeView.swift
//  SwiftUICode
//
//  Created by HuangSenhui on 2020/5/5.
//  Copyright © 2020 H.Senhui. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @Binding var isShowProfile: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Hello, SwiftUI!")
                    .font(.system(size: 20, weight: .bold))
                
                Spacer()
                AvatarView(isShowProfile: $isShowProfile)
            }
            .padding(.horizontal)
            .padding(.leading, 14)
            .padding(.top, 30)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20.0) {
                    ForEach(sectionData) { item in
                        GeometryReader { geometry in
                            SectionView(section: item)
                                .rotation3DEffect(
                                    Angle(
                                        degrees: Double(geometry.frame(in: .global).minX - 30) / 20 // minX 左边为中轴
                                    ),
                                    axis: (x: 0, y: -10, z: 0))

                        }
                        .frame(width: 275, height: 275)
                    }
                }
                .padding(30)
                .padding(.bottom, 30)
            }
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(isShowProfile: .constant(false))
    }
}

struct SectionView: View {
    var section: Section
    
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
                .frame(width: 200)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: 275, height: 275)
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
    Section(title: "Design in SwiftUI", text: "40 小节课程", logo: "swiftui_logo", image: Image("post_1"), color: Color.red),
    Section(title: "Design in SwiftUI", text: "30 小节课程", logo: "swiftui_logo", image: Image("post_1"), color: Color.green),
    Section(title: "Design in SwiftUI", text: "20 小节课程", logo: "swiftui_logo", image: Image("post_1"), color: Color.blue),
    Section(title: "Design in SwiftUI", text: "10 小节课程", logo: "swiftui_logo", image: Image("post_1"), color: Color.purple),
    Section(title: "Design in SwiftUI", text: "5 小节课程", logo: "swiftui_logo", image: Image("post_1"), color: Color.gray),
    
]
