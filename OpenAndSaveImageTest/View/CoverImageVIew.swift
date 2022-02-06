//
//  CoverImageVIew.swift
//  DevicesCaseScreenshot
//
//  Created by Runhua Huang on 2022/1/23.
//

import SwiftUI

struct CoverImageView: View {
    
    @EnvironmentObject var imageData: ImageData
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 512, height: 600)
                .foregroundColor(.blue)

            Image(nsImage: NSImage(byReferencing: imageData.url))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 512, height: 512)
                .importsItemProviders(ImageImportFromDevice.importImageTypes) { providers in
                    ImageImportFromDevice.importImageFromProviders(providers) { url in
                        if let url = url {
                            imageData.url = url
                        }
                    }
                }
        }
    }
}

struct CoverImageVIew_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
    }
}
