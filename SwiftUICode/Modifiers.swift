//
//  Modifiers.swift
//  SwiftUICode
//
//  Created by HuangSenhui on 2020/5/5.
//  Copyright © 2020 H.Senhui. All rights reserved.
//

import SwiftUI

struct ShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
    }
}


struct FontModifier: ViewModifier {
    var style: Font.TextStyle = .body
    func body(content: Content) -> some View {
        content
            .font(.system(style, design: .rounded))
    }
}

// 使用自定义字体
// 1. 引入字体文件
// 2. info.plist 添加属性 Fonts provided by... (对应的字体库文件名)
// 3. .custom("")
