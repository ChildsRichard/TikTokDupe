//
//  UploadPostView.swift
//  TikTokDupe
//
//  Created by Richard Childs on 4/30/24.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
import PhotosUI

struct UploadPostView: View {
    @Environment(\.dismiss) var dismiss
    @State private var caption = ""
    
    var videoThumbnail: UIImage
    var videoUrl: String
    let user: TikTokUser
    @State var post: Post
    
    init(videoURL: String, user: TikTokUser,post: Post, videoThumbnail: UIImage){
        self.videoUrl = videoURL
        self.user = user
        self.videoThumbnail = videoThumbnail
        self._post = State(initialValue: post)
    }
    
    var body: some View {
        VStack {
            VStack{
                
                HStack(alignment: .top){
                    TextField("Enter your caption", text: $caption,axis: .vertical)
                    
                    Spacer()
                    
                    Image(uiImage: videoThumbnail)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 88, height: 100)
                        .clipShape(.rect(cornerRadius: 10))
                }
                
            }
            
            
            
            Divider()
            
            Spacer()
            
            Button("Post"){
                Task{
                    await createPost()
                }
                print("DEBUG: Upload post..")
                    
            }
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(width: 350, height: 44)
            .background(Color(.systemPink))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
        }
        .padding()
        .navigationTitle("Post")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel"){
                    dismiss()
                }
            }
        }
    }
    
}

extension UploadPostView {
    
    func createPost() async {
        post.videoUrl = videoUrl
        post.id = NSUUID().uuidString
        post.caption = caption
        post.ownerUserId = user.id
        
        do{
            try await uploadPostData(post)
        } catch {
            print("create post error: \(error)")
        }
        
    }
    
    func uploadPostData(_ post: Post) async throws {
        do {
            let postData = try Firestore.Encoder().encode(post)
            try await FireStoreConstants.PostsCollections.document(post.id).setData(postData)
        } catch {
            throw error
        }
    }
    
  
    
    
}


#Preview {
    UploadPostView(videoURL: "", user: DeveloperPreview.user,post: DeveloperPreview.post, videoThumbnail: DeveloperPreview.thumbnail!)
}
