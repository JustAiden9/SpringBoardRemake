//
//  DockView.swift
//  IOS
//
//  Created by JustAiden on 9/1/24.
//

import SwiftUI

struct DockView: View {
    // Replace these with the names of your custom image assets
    let dockIcons = ["com.apple.mobilephone-large", "com.apple.MobileSMS-large", "com.apple.mobilesafari-large", "com.apple.Music-large"]
    
    // URL schemes for the dock apps
    let dockURLs = [
        "com.apple.mobilephone-large": "tel://",
        "com.apple.MobileSMS-large": "sms://",
        "com.apple.mobilesafari-large": "http://",
        "com.apple.Music-large": "music://"
    ]
    
    var body: some View {
        HStack {
            ForEach(dockIcons, id: \.self) { icon in
                if let urlString = dockURLs[icon], let url = URL(string: urlString) {
                    Button(action: {
                        #if !targetEnvironment(simulator)
                        UIApplication.shared.open(url)
                        #endif
                    }) {
                        Image(icon)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 55, height: 50)
                            .clipShape(Circle()) // Make the icon rounded
                            .foregroundColor(.primary)
                    }
                    .padding(.horizontal, 10)
                } else {
                    Image(icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 55, height: 50)
                        .clipShape(Circle()) // Make the icon rounded
                        .foregroundColor(.primary)
                        .padding(.horizontal, 10)
                }
            }
        }
        .padding(.vertical, 10)
        .background(
            VisualEffectBlur(blurStyle: .systemMaterialDark)
                .background(Color.black.opacity(0))
                .cornerRadius(50)
                .shadow(radius: 10)
        )
        .padding(.horizontal, 20)
    }
}

#Preview {
    DockView()
}
