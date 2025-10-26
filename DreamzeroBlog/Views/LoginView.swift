//
//  LoginView.swift
//  DreamzeroBlog
//
//  Created by dreamzero on 2025/10/25.
//

import SwiftUI

struct LoginView: View {

    @State private var username = ""
    @State private var password = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TextField("账号", text: $username)
                    .textFieldStyle(.roundedBorder)
                    .cornerRadius(10)
                    .padding()
                SecureField("密码", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .cornerRadius(10)
                    .padding()
                Button("登录") {
                    // 调你自己的登录接口
                    
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .navigationTitle("登录")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
