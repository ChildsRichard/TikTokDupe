//
//  EditProfileDetailView.swift
//  TikTokDupe
//
//  Created by Richard Childs on 4/29/24.
//

import SwiftUI

struct EditProfileDetailView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var value = ""
    
     let options: EditProfileOptions
     let user: TikTokUser
    
    var body: some View {
        VStack(alignment: .leading){
        
            HStack {
                TextField("Change User Name", text: $value)
                
                Spacer()
                
                if !value.isEmpty {
                    Button{
                        value = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.gray)
                    }
                }
        }
            
            Divider()
            
            Text(subtitle)
                .font(.footnote)
                .foregroundStyle(.gray)
                .padding(.top, 8)
            
            Spacer()
        }
        .padding()
        .navigationTitle(options.title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .onAppear{ onViewAppear() }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel"){ dismiss() }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save"){
                    dismiss()
                }
                .fontWeight(.semibold)
                
            }
        }
        
    }
        
}

private extension EditProfileDetailView {
    var subtitle:  String {
        switch options {
        case .name:
            return "Your nickname can only be changed once every 7 days."
        case .userName:
            return "Usernames can contain only letters, numbers, underscores and periods."
        case .bio:
            return "Tell us a bit about yourself"
        }
    }
    
    func onViewAppear() {
        switch options {
        case .name:
            value = user.fullName
        case .userName:
            value = user.userName
        case .bio:
            value = user.bio ?? ""
        }
    }
}



#Preview {
    
    NavigationStack {
        EditProfileDetailView(options: EditProfileOptions.name, user: DeveloperPreview.user)
            .tint(.primary)
    }
}
