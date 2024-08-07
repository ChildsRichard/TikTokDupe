//
//  NotificationView.swift
//  TikTokDupe
//
//  Created by Richard Childs on 3/21/24.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack(spacing: 24) {
                    ForEach(0 ..< 10){ notification in
                        NotificationCell()
                            
                    }
                    
                }
            }
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.vertical)
        }
        
    }
}

#Preview {
    NotificationView()
}
