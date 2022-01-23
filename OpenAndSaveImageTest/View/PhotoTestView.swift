//
//  PhotoTestView.swift
//  DevicesCaseScreenshot
//
//  Created by Runhua Huang on 2022/1/23.
//

import SwiftUI
import UniformTypeIdentifiers

struct PhotoTestView: View {
    
    @State private var imageUrl: URL = URL(fileURLWithPath: "")
    
    @EnvironmentObject var imageData: ImageData
    
    var body: some View {
        VStack {
            CoverImageView()
            
            Divider()
                .frame(width: 1024)
            
            HStack {
                Button(action: {
                    if let openURL = ImageProcess().showOpenPanel() {
                        imageUrl = openURL
                        if let codedImages = try? Data(contentsOf: openURL) {
                            imageData.imagedata = codedImages
                            // ImageProcess().saveImageToApp(data: codedImages)
                        }
                    }
                }, label: {
                    Image(systemName: "doc.badge.plus")
                })
                
                Button(action: {
                    ImageProcess().saveImage()
                }, label: {
                    Image(systemName: "square.and.arrow.down")
                })
            }.padding()
        }
    }
}

struct PhotoTestView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoTestView()
    }
}




