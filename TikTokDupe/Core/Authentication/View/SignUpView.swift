//
//  SignUpView.swift
//  TikTokDupe
//
//  Created by Richard Childs on 4/16/24.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var fullName = ""
    @State private var userName = ""
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: RegistrationViewModel
    private var authService: AuthService
    
    init(authService: AuthService){
        self.authService = authService
        
        let vm = RegistrationViewModel(authService: authService)
        self._viewModel = StateObject(wrappedValue: vm)
        
    }
    
    var body: some View {
        
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
                
                TextField("Enter Your Full Name", text: $fullName)
                    .textInputAutocapitalization(.never)
                    .modifier(StandardTextFieldModifier())
                
                TextField("Enter Your User Name", text: $userName)
                    .textInputAutocapitalization(.never)
                    .modifier(StandardTextFieldModifier())
                }
            
            Button {
                Task { await viewModel.createUser(withEmail: email,
                                                  password: password,
                                                  fullName: fullName,
                                                  userName: userName)
                }
            } label: {
                Text("Sign Up")
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
            
            Divider()
            
            Button{
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .padding(.vertical)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

extension SignUpView: AuthenticationFormProtocol{
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && !fullName.isEmpty
        && !userName.isEmpty
    }
    
    
    
}


#Preview {
    SignUpView(authService: AuthService())
}
