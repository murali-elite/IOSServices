//
//  LoginView.swift
//  CalixIOSServiceExample
//
//  Created by labmacuser3 on 8/7/24.
//

import SwiftUI
import IOSServices

struct LoginView: View {
    @StateObject private var viewModel: ViewModel = ViewModel()
    
    @State private var loginModel: LoginModel?
    @State private var isLoading: Bool = false
    
    var body: some View {
        VStack {
            if isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
                    .padding()
            }
            
            if let loginModel = loginModel {
                Text("Welcome, \(loginModel.email ?? "User")!")
            }
            
            Button(action: {
                Task {
                    isLoading = true
                    let result = try await viewModel.sendLoginRequest(email: "jessicasmb@calix.com", password: "12345678")
                    isLoading = false
                    if let result = result {
                        loginModel = result
                        print("Result", result)
                    } else {
                       print("Failed to login")
                    }
                }
            }) {
                Text("Login")
            }
        }
    }
}
