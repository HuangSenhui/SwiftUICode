//
//  WebData.swift
//  SwiftUICode
//
//  Created by HuangSenhui on 2020/5/5.
//  Copyright © 2020 H.Senhui. All rights reserved.
//

import SwiftUI

/// 海报
struct Post: Codable, Identifiable {
    let id = UUID()
    var title: String
    var body: String
    
}

class API {
    func getPosts(completion: @escaping ([Post])->Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                print("请求失败：\(String(describing: error))")
                return
            }
            let posts = try! JSONDecoder().decode([Post].self, from: data)
            
            DispatchQueue.main.async {
                completion(posts)
            }
        }.resume()
    }
}
