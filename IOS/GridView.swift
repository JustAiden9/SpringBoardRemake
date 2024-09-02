//
//  HomeScreenView.swift
//  IOS
//
//  Created by JustAiden on 9/1/24.
//

import SwiftUI

struct GridView: View {
    let appIcons: [String]
    let appURLs: [String: String]
    
    private let columns = [
        GridItem(.flexible()), GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(appIcons, id: \.self) { icon in
                if let urlString = appURLs[icon], let url = URL(string: urlString) {
                    Button(action: {
                        #if !targetEnvironment(simulator)
                        UIApplication.shared.open(url)
                        #endif
                    }) {
                        Image(icon)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                            .foregroundColor(.primary)
                    }
                } else {
                    Image(icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .foregroundColor(.primary)
                }
            }
        }
        .padding(.horizontal, 100)
        .padding(.vertical, 120)
    }
}

#Preview {
    GridView(appIcons: ["com.airbnb.app-large", "com.apple.mobilemail-large"], appURLs: ["com.airbnb.app-large": "airbnb://", "com.apple.mobilemail-large": "mailto://"])
}
