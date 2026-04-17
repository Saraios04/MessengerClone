//
//  AppImageView.swift
//  MessengerClone
//
//  Created by seemakus on 4/16/26.
//

import Foundation
import SwiftUI

enum AppImageSource {
    case asset(String)
    case systemImage(String)
}


struct AppImageView : View {
    
    var imageSource : AppImageSource
    let imageWidth: CGFloat
    let imageHeight: CGFloat
    var contentMode : ContentMode = .fit
    
    private var image: Image {
        switch(imageSource) {
            case .asset(let imageName):
                Image(imageName)
            case .systemImage(let systemImageName):
                Image(systemName: systemImageName)
        }
    }
    
    var body: some View {
             image
            .resizable()
            .aspectRatio(contentMode: contentMode)
            .frame(width: imageWidth, height: imageHeight)
            
        
    }
}
