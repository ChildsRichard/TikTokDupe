//
//  MediaSelector.swift
//  TikTokDupe
//
//  Created by Richard Childs on 4/30/24.
//

import SwiftUI
import PhotosUI
import AVKit

struct MediaSelectorView: View {
    @State private var player = AVPlayer()
    @State private var showMediaPicker = false
    @State private var selectedItem: PhotosPickerItem?
    @State private var mediaPreview: Movie?
    @State private var videoURL: String?
    @State var videoUploadService: VideoUploadService
    @State var imageUploadService: ImageUploadService
    @State var videoThumbnail: UIImage?
    @State var thumbnailUrl: String?
    
    let user: TikTokUser
    var post: Post
    
    var body: some View {
        
        NavigationStack{
            VStack{
                if let mediaPreview {
                    CustomVideoPlayer(player: player)
                        .onAppear {
                            player.replaceCurrentItem(with: .init(url: mediaPreview.url))
                            player.play()
                            uploadSelectedVideo()
                            extractFirstFrame(from: mediaPreview.url)
                    
                            
                        }
                        .padding()
                }
            }
            .task(id: selectedItem) {
                await loadMediaPreview(fromItem: selectedItem)
            }
            .navigationTitle("New Post")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear{ showMediaPicker.toggle() }
            .photosPicker(isPresented: $showMediaPicker, selection: $selectedItem, matching: .videos)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink("Next"){
                         
                        UploadPostView(videoURL: videoURL ?? "", user: user,post: post, videoThumbnail: videoThumbnail ?? Image(systemName: "photo.artframe.circle.fill"))
                        
                    }
                }
            }
        }
    }
}
    
    private extension MediaSelectorView {
        func loadMediaPreview(fromItem item: PhotosPickerItem?) async {
            guard let item else { return }
            self.mediaPreview = try? await item.loadTransferable(type: Movie.self)
            if let mediaPreview {
                       videoURL = mediaPreview.url.absoluteString
                       extractFirstFrame(from: mediaPreview.url)
                   }
        }
        func uploadSelectedVideo() {
            Task{
                guard let mediaPreview else { return }
                try await videoURL = videoUploadService.uploadVideo(movieurl: mediaPreview.url)
                
                
            }
        }
        func uploadThumbnail() {
            Task{
                guard let mediaPreview else { return }
                let thumbnailUIImage =
                try await thumbnailUrl = imageUploadService.uploadThumbnail(image: UIImage(self.videoThumbnail))
                
                
            }
        }
        
        func extractFirstFrame(from url: URL) {
            guard mediaPreview != nil else { return }
            guard videoURL != nil else { return }
            let asset = AVAsset(url: url)
            let generator = AVAssetImageGenerator(asset: asset)
                    generator.appliesPreferredTrackTransform = true

            let time = CMTime(seconds: 0.0, preferredTimescale: 600)
            do{
                let cgImage = try generator.copyCGImage(at: time, actualTime: nil)
                let uiImage = UIImage(cgImage: cgImage)
                DispatchQueue.main.async {
                    self.videoThumbnail = uiIma //firstFrame is UIImage in table cell
                }
            } catch {
                print("\(error)")
            }
        }
        
        
        
    }


#Preview {
    MediaSelectorView(videoUploadService: VideoUploadService(), videoThumbnail: DeveloperPreview.thumbnail,user: DeveloperPreview.user, post: Post(id: NSUUID().uuidString, ownerUserId: DeveloperPreview.user.id, videoUrl: "https://firebasestorage.googleapis.com/v0/b/tiktokclone-5a433.appspot.com/o/post_videos%2F209CB10F-68BA-49B1-A6AD-D484D4501D34.mov?alt=media&token=a139844a-c957-411e-8919-12f7a223e6e3"))
}
