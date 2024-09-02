//
//  HomeScreenView.swift
//  IOS
//
//  Created by JustAiden on 9/1/24.
//

import SwiftUI

struct HomeScreenView: View {
    let appIcons = ["com.airbnb.app-large", "com.apple.mobilemail-large", "com.apple.mobilenotes-large", "com.hammerandchisel.discord-large", "com.google.ios.youtubemusic-large", "com.google.ios.youtube-large"]
    
    let appURLs = [
        "com.airbnb.app-large": "airbnb://",
        "com.apple.mobilemail-large": "message://",
        "com.apple.mobilenotes-large": "mobilenotes://",
        "com.hammerandchisel.discord-large": "discord://",
        "com.google.ios.youtubemusic-large": "youtubemusic://",
        "com.google.ios.youtube-large": "youtube://"
    ]
    
    var body: some View {
        VStack {
            Spacer()
            
            // Centered icons
            GridView(appIcons: appIcons, appURLs: appURLs)
                .padding(.bottom, 50)
            
            // Dock at the bottom
            DockView()
        }
        .background(
            Image("background")
                .resizable()
                .scaledToFill()
                .blur(radius: 5)
                .scaleEffect(1.2)
                .ignoresSafeArea()
        )
    }
}

#Preview {
    HomeScreenView()
}
