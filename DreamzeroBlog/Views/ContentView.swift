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

            OtherTabView()
                .tabItem {
                    Label("More", systemImage: "ellipsis.circle")
                }
            
            // Daily Photo View
            PhotoGridView()
                .tabItem {
                    Label("Daily Photo", systemImage: "photo")
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
}
