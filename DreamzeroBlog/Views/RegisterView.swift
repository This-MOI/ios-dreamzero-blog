//
//  RegisterView.swift
//  DreamzeroBlog
//
//  Created by AI Assistant on 2025/10/25.
//

import SwiftUI

/// 注册主视图 - 管理整个注册流程
struct RegisterView: View {
    @State private var viewModel = RegisterViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            Group {
                switch viewModel.currentStep {
                case .basicInfo:
                    RegisterBasicInfoView(viewModel: viewModel)
                        .navigationTitle("注册")
                        .navigationBarTitleDisplayMode(.inline)
                        
                case .verification:
                    RegisterVerificationView(viewModel: viewModel)
                        .navigationTitle("验证邮箱")
                        .navigationBarTitleDisplayMode(.inline)
                        
                case .success:
                    RegisterSuccessView(viewModel: viewModel)
                        .navigationTitle("注册成功")
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    if viewModel.currentStep != .success {
                        Button("取消") {
                            dismiss()
                        }
                        .foregroundColor(.blue)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    if viewModel.currentStep == .basicInfo {
                        Button("下一步") {
                            viewModel.register()
                        }
                        .foregroundColor(viewModel.isBasicInfoValid ? .blue : .gray)
                        .disabled(!viewModel.isBasicInfoValid)
                    } else if viewModel.currentStep == .verification {
                        Button("验证") {
                            viewModel.verifyCode()
                        }
                        .foregroundColor(viewModel.isVerificationCodeValid ? .blue : .gray)
                        .disabled(!viewModel.isVerificationCodeValid)
                    }
                }
            }
        }
        .accentColor(.blue)
    }
}

// MARK: - 预览
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
