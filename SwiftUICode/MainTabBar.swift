//
//  MainTabBar.swift
//  SwiftUICode
//
//  Created by HuangSenhui on 2020/5/5.
//  Copyright © 2020 H.Senhui. All rights reserved.
//

import SwiftUI

struct MainTabBar: View {
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Image(systemName: "star")
                    Text("Home")
            }
            CourseList()
                .tabItem {
                    Image(systemName: "book")
                    Text("章节")
            }
            ContentView()
                .tabItem {
                    Image(systemName: "photo")
                    Text("Content")
            }
        }
//        .padding(.top,44)
//        .edgesIgnoringSafeArea(.top)
    }
}

struct MainTabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
//            MainTabBar().previewDevice("iPhone 8")
            MainTabBar().previewDevice("iPhone 11 Pro")
        }
    }
}
