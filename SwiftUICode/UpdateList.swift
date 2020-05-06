//
//  UpdateList.swift
//  SwiftUICode
//
//  Created by HuangSenhui on 2020/5/5.
//  Copyright © 2020 H.Senhui. All rights reserved.
//

import SwiftUI

struct UpdateList: View {
    @ObservedObject var store = UpdateStore()
    
    func addUpdate() {
        let newUpdate = Update(image: "swiftui_logo", title: "SwiftUI New", text: "新内容，更新啦！", date: "May 5")
        store.updates.append(newUpdate)
    }
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach((store.updates)) { item in
                    NavigationLink(destination: UpdateDetail(update: item)) {
                        HStack {
                            Image(item.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 80)
                                .background(Color.black)
                                .cornerRadius(30)
                                .padding(.trailing, 4)
                            
                            VStack(alignment: .leading, spacing: 8.0) {
                                Text(item.title)
                                    .font(.system(size: 20, weight: .bold))
                                
                                Text(item.text)
                                    .lineLimit(2)
                                    .font(.subheadline)
                                    .foregroundColor(Color.gray)
                                
                                Text(item.date)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
                .onDelete { index in
                    self.store.updates.remove(at: index.first!)
                }
                .onMove { (source: IndexSet, destination: Int) in
                    self.store.updates.move(fromOffsets: source, toOffset: destination)
                }
            }
            .navigationBarTitle(Text("更新课程"))
            .navigationBarItems(leading: Button(action: {
                self.addUpdate()
            }) {
                Text("添加课程")
            }, trailing: EditButton())
            
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}

struct Update: Identifiable {
    let id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
    
}

let updateData = [
    Update(image: "swiftui_logo", title: "SwiftUI 1", text: "SwiftUI in action,SwiftUI in action,SwiftUI in action,SwiftUI in action,SwiftUI in action,SwiftUI in action,SwiftUI in action.", date: "May 5"),
    Update(image: "huoying_post1", title: "SwiftUI 2", text: "SwiftUI in action", date: "May 5"),
    Update(image: "swiftui_logo", title: "SwiftUI 3", text: "SwiftUI in action", date: "May 5"),
    Update(image: "huoying_post1", title: "SwiftUI 4", text: "SwiftUI in action", date: "May 5"),
    Update(image: "swiftui_logo", title: "SwiftUI 5", text: "SwiftUI in action", date: "May 5"),
]
