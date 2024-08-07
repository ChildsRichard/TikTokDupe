//
//  EditProfileOptionRowView.swift
//  TikTokDupe
//
//  Created by Richard Childs on 4/29/24.
//

import SwiftUI

struct EditProfileOptionRowView: View {
    var options: EditProfileOptions
    let value: String
    
    var body: some View {
        NavigationLink(value: options) {
           
                Text(options.title)
                
                Spacer()
                
                Text(value)
            }.foregroundStyle(.primary)
    }
}

#Preview {
    EditProfileOptionRowView(options: .userName, value: "MainEventJeyUso")
}
