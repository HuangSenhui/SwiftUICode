//
//  CourseDetail.swift
//  SwiftUICode
//
//  Created by HuangSenhui on 2020/5/5.
//  Copyright © 2020 H.Senhui. All rights reserved.
//

import SwiftUI

struct CourseDetail: View {
    var course: Course
    
    @Binding var isShow: Bool
    @Binding var isActive: Bool
    @Binding var activeIndex: Int
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 8.0) {
                            Text("SwiftUI 进阶")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(Color.white)
                            Text("刻意练习")
                                .foregroundColor(Color.white.opacity(0.7))
                        }
                        
                        Spacer()
                        ZStack {
                            VStack {
                                Image(systemName: "xmark")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                            }
                            .frame(width: 36, height: 36)
                            .background(Color.black)
                            .clipShape(Circle())
                            .onTapGesture {
                                self.isShow = false
                                self.isActive = false
                                self.activeIndex = -1
                            }
                        }
                    }
                    
                    Spacer()
                    Image(uiImage: course.iamge)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity)
                        .frame(height: 140, alignment: .top)
                }
                .padding(isShow ? 30 : 20)
                .padding(.top, isShow ? 30 : 20)
                .frame(maxWidth: isShow ? .infinity : MAINSCREEN.width - 60, maxHeight: isShow ? 460 : 200)
                .background(Color(course.color))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color(course.color).opacity(0.3), radius: 20, x: 0, y: 20)
                
                VStack(alignment: .leading, spacing: 30.0) {
                    Text(course.subTitle)
                    
                    Text(course.title)
                        .font(.title).bold()
                    
                    Text("话说十六年起，九尾袭击木叶村。名人老爸舍命将九尾封印到刚出生的名人体内，就是为了对付那个带面具的神秘人...话说十六年起，九尾袭击木叶村。名人老爸舍命将九尾封印到刚出生的名人体内...话说十六年起，九尾袭击木叶村。名人老爸舍命将九尾封印到刚出生的名人体内...话说十六年起，九尾袭击木叶村。名人老爸舍命将九尾封印到刚出生的名人体内...")
                    
                    Text("这就是SwiftUI SwiftUI SwiftUI SwiftUI 啦啦啦, SwiftUI SwiftUI SwiftUI SwiftUI SwiftUI SwiftUI SwiftUI SwiftUI SwiftUI SwiftUI SwiftUI SwiftUI SwiftUI SwiftUI SwiftUI SwiftUI 多多练习呀")
                }
                .padding(30)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct CourseDetail_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetail(course: courseData[0], isShow: .constant(true),isActive: .constant(true), activeIndex: .constant(-1))
    }
}
