//
//  EditProfileView.swift
//  TikTokDupe
//
//  Created by Richard Childs on 4/28/24.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var selectedPickerItem: PhotosPickerItem?
    @State private var profileImage: Image?
    @State private var uiImage: UIImage?
    @StateObject var manager = EditProfileManager(imageUploadService: ImageUploadService())
    
    let user: TikTokUser
    
    var avatarSize: AvatarSize {
        return .large
    }
    
    var body: some View {
        NavigationStack{
            VStack {
                    PhotosPicker(selection: $selectedPickerItem, matching: .images){
                        VStack {
                            if let image = profileImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: avatarSize.dimension, height: avatarSize.dimension)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            } else {
                                AvatarView(user: user,size: avatarSize)
                            }
                            
                            
                            
                             Text("Change Photo")
                        }
                    
                }
                .padding()
                
                VStack(alignment: .leading,spacing: 24){
                    Text("About you")
                        .font(.footnote)
                        .foregroundStyle(Color(.systemGray2))
                        .fontWeight(.semibold)
                    
        // extracted subview
                    EditProfileOptionRowView(options: EditProfileOptions.name,
                                             value: user.fullName)
                    
                    EditProfileOptionRowView(options: EditProfileOptions.userName,
                                             value: user.userName)
                    
                    EditProfileOptionRowView(options: EditProfileOptions.bio,
                                             value: user.bio ?? "Add a bio")
                    
                }
                .font(.subheadline)
                .padding()
                
                
                Spacer()
                
            }
            .task(id: selectedPickerItem) {
                await loadImage(fromItem: selectedPickerItem)
            }
            .navigationDestination(for: EditProfileOptions.self, destination: { option in
                EditProfileDetailView(options: option, user: user)
            })
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel"){
                        dismiss()
                    }
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done"){
                        onDoneTapped()
                    }
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    
                }
            }
        }
    }
}


private extension EditProfileView {
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data: data) else { return }
        
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func onDoneTapped() {
        Task {
            guard let uiImage else {return}
            await manager.uploadProfileImage(uiImage)
            dismiss()
        }
    }
    
   
}

#Preview {
    EditProfileView(user: DeveloperPreview.user)
}


