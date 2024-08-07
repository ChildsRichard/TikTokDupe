//
//  StandardTextFieldModifier.swift
//  TikTokDupe
//
//  Created by Richard Childs on 4/21/24.
//

import SwiftUI

struct StandardTextFieldModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 24)
    }
}
