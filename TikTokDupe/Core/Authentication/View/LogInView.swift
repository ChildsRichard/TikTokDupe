//
//  LogInView.swift
//  TikTokDupe
//
//  Created by Richard Childs on 4/16/24.
//

import SwiftUI

struct LogInView: View {
    
    @State private var email = ""
    @State private var password = ""
    @StateObject var viewModel: LogInViewModel
    private let authService: AuthService
    
    init(authService: AuthService){
        self.authService = authService
        let vm = LogInViewModel(authService: authService)
        self._viewModel = StateObject(wrappedValue: vm)
    }
    
    
    
    var body: some View {
        NavigationStack{
            
            VStack{
                
                Spacer()
                
                //logo image
                Image("tiktok-app-icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
                
                //text fields
                
                VStack{
                    TextField("Enter Your Email", text: $email)
                        .textInputAutocapitalization(.never)
                        .modifier(StandardTextFieldModifier())
                        
                    
                    SecureField("Enter Your Password", text: $password)
                        .modifier(StandardTextFieldModifier())
                }
                
                NavigationLink {
                    Text("Forgot Password")
                } label: {
                    Text("Forgot Password")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                }

                
                //button
                
                Button {
                    Task { await viewModel.login(withEmail: email, password: password)}
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 350, height: 44)
                        .background(Color(.systemPink))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding(.vertical)
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1 : 0.65)
                
                Spacer()
                
                //go to sign up
                Divider()
            }
            
            NavigationLink {
                SignUpView(authService: authService)
            } label: {
                HStack(spacing: 3) {
                    Text("Don't have an account?")
                    
                    Text("Sign Up")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .padding(.vertical)
            } 
        }
    }
}

// MARK: - AuthenticationFormProtocol

extension LogInView: AuthenticationFormProtocol{
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
    }
    
    
}




#Preview {
    LogInView(authService: AuthService())
}
