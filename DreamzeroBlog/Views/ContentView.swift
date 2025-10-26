//
//  ContentView.swift
//  DreamzeroBlog
//
//  Created by dreamzero on 2025/10/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            // 第一个 Tab
            ItemListView()
                .tabItem {
                    Label("Items", systemImage: "list.dash")
                }

            // 第二个 Tab
            OtherTabView()
                .tabItem {
                    Label("More", systemImage: "ellipsis.circle")
                }
            
            // Login Tab
            LoginView()
                .tabItem {
                    Label("Login", systemImage: "person.crop.circle")
                }
        }
    }
}


#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
