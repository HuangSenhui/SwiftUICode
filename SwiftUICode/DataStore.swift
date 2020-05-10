//
//  DataStore.swift
//  SwiftUICode
//
//  Created by HuangSenhui on 2020/5/10.
//  Copyright © 2020 H.Senhui. All rights reserved.
//

import SwiftUI
import Combine

class DataStore: ObservableObject {
    @Published var posts: [Post] = []
    
    
    func getPosts() {
        API().getPosts { posts in
            self.posts = posts
        }
    }
}
