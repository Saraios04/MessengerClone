//
//  AppImageView.swift
//  MessengerClone
//
//  Created by seemakus on 4/16/26.
//

import Foundation
import SwiftUI

struct AppImageView : View {
    let imageName : String
    let imageWidth: CGFloat
    let imageHeight: CGFloat
    var contentMode : ContentMode 
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: contentMode)
            .frame(width: imageWidth, height: imageHeight)
            .padding()
        
    }
}
