//
//  CourseList.swift
//  SwiftUICode
//
//  Created by HuangSenhui on 2020/5/5.
//  Copyright © 2020 H.Senhui. All rights reserved.
//

import SwiftUI

struct CourseList: View {
    //@State var isShow = false
    @State var courses = courseData
    @State var isActive = false
    @State var activeIndex = -1 // 用于外部modifier操作
    @State var avtiveView = CGSize.zero
    
    var body: some View {
        ZStack {
            // 过渡背景色
            Color.black.opacity(Double(self.avtiveView.height / 500))   // 0.6
                .animation(.linear)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                Text("火影章节")
                    .font(.largeTitle).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                    .padding(.top, 30)
                    .blur(radius: isActive ? 20 : 0)
                
                VStack(spacing: 30) {
                    ForEach(courses.indices, id: \.self) { index in
                        GeometryReader { geomety in
                            CourseView(course: self.courses[index],
                                       index: index,
                                       activeIndex: self.$activeIndex,
                                       isShow: self.$courses[index].isShow,
                                       isActive: self.$isActive,
                                       activeView: self.$avtiveView
                            )
                                .offset(y: self.courses[index].isShow ? -geomety.frame(in: .global).minY : 0)
                                .opacity(self.activeIndex != index && self.isActive ? 0 : 1)
                                .scaleEffect(self.activeIndex != index && self.isActive ? 0.5 : 1)
//                                .offset(x: self.activeIndex != index && self.isActive ? MAINSCREEN.width : 0) // 侧边移动动画
                        }
                        .frame(height: 200)
                        .frame(maxWidth: self.courses[index].isShow ? .infinity : MAINSCREEN.width - 60)
                        .frame(maxWidth: .infinity)
                        .zIndex(self.courses[index].isShow ? 1 : 0) // 提升显示层级
                        
                    }
                }
                .frame(width: MAINSCREEN.width)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            }
            .statusBar(hidden: isActive)    // 状态栏
            .animation(.linear)
        }
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}

struct CourseView: View {
    var course: Course
    var index: Int
    
    @Binding var activeIndex: Int
    @Binding var isShow: Bool
    @Binding var isActive: Bool
    //@State var activeView = CGSize.zero
    @Binding var activeView: CGSize
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 30.0) {
                Text(course.subTitle)
                
                Text(course.title)
                    .font(.title).bold()
                
                Text("话说十六年起，九尾袭击木叶村。名人老爸舍命将九尾封印到刚出生的名人体内，就是为了对付那个带面具的神秘人...话说十六年起，九尾袭击木叶村。名人老爸舍命将九尾封印到刚出生的名人体内...话说十六年起，九尾袭击木叶村。名人老爸舍命将九尾封印到刚出生的名人体内...话说十六年起，九尾袭击木叶村。名人老爸舍命将九尾封印到刚出生的名人体内...")
                
                Text("这就是SwiftUI SwiftUI SwiftUI SwiftUI 啦啦啦l,SwiftUI SwiftUI SwiftUI SwiftUI SwiftUI SwiftUI SwiftUI SwiftUI SwiftUI SwiftUI SwiftUI SwiftUI SwiftUI SwiftUI SwiftUI SwiftUI 多多练习呀")
            }
            .padding(30)
            .frame(maxWidth: isShow ? .infinity : MAINSCREEN.width - 60, maxHeight: isShow ? .infinity : 200, alignment: .top)
            .offset(y: isShow ? 460 : 0)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .opacity(isShow ? 1 : 0)
            
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
                        Image(uiImage: course.logo)
                            .resizable()
                            .frame(width: 36, height: 36)
                            .clipShape(Circle())
                            .opacity(isShow ? 0 : 1)
                        
                        VStack {
                            Image(systemName: "xmark")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                        }
                        .frame(width: 36, height: 36)
                        .background(Color.black)
                        .clipShape(Circle())
                        .opacity(isShow ? 1 : 0)
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
            .gesture(
                // 显示时添加手势
                isShow ?
                DragGesture().onChanged { value in
                    guard value.translation.height > 0, value.translation.height < 300 else {
                        return
                    }
                    self.activeView = value.translation
                }
                .onEnded { value in
                    if self.activeView.height > 50 {
                        // 退出
                        self.isShow = false
                        self.isActive = false
                        self.activeIndex = -1
                    }
                    self.activeView = .zero
                } : nil
            )
                .onTapGesture {
                    self.isShow.toggle()
                    self.isActive.toggle()
                    if self.isShow {
                        self.activeIndex = self.index
                    } else {
                        self.activeIndex = -1
                    }
            }
            
            // 将数据进行分离
//            if isShow {
//                CourseDetail(course: course, isShow: $isShow, isActive: $isActive, activeIndex: $activeIndex)
//                    .background(Color.white)
//                    .animation(nil)
//            }
            
        }
        .frame(height: isShow ? MAINSCREEN.height : 200)
        .scaleEffect(1 - self.activeView.height / 1000) // 0.9、0.8、0.6
        .rotation3DEffect(Angle(degrees: Double(self.activeView.height / 10)), axis: (x: 0, y: 10.0, z: 0))
        .hueRotation(Angle(degrees: Double(self.activeView.height)))    // 颜色变换
        .animation(.spring(response: 0.5, dampingFraction: 0.6))
        .edgesIgnoringSafeArea(.all)
    }
}


struct Course: Identifiable {
    var id = UUID()
    var title: String
    var subTitle: String
    var iamge: UIImage
    var logo: UIImage
    var color: UIColor
    var isShow: Bool
}

var courseData = [
    Course(title: "火影忍者 -- 疾风传", subTitle: "青春、热血、拼搏、友情、", iamge: #imageLiteral(resourceName: "huoying_post1"), logo: #imageLiteral(resourceName: "swiftui_logo"), color: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), isShow: false),
    Course(title: "火影忍者 -- 疾风传", subTitle: "青春、热血、拼搏、友情、", iamge: #imageLiteral(resourceName: "huoying_post1"), logo: #imageLiteral(resourceName: "swiftui_logo"), color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), isShow: false),
    Course(title: "火影忍者 -- 疾风传", subTitle: "青春、热血、拼搏、友情、", iamge: #imageLiteral(resourceName: "huoying_post1"), logo: #imageLiteral(resourceName: "swiftui_logo"), color: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), isShow: false),
]
