//
//  PhotoTestView.swift
//  DevicesCaseScreenshot
//
//  Created by Runhua Huang on 2022/1/23.
//

import SwiftUI
import UniformTypeIdentifiers

struct PhotoTestView: View {
    
    @EnvironmentObject var imageData: ImageData
    
    var body: some View {
        VStack {
            CoverImageView()
            
            Divider()
                .frame(width: 1024)
            
            HStack {
                Button(action: {
                    if let openURL = ImageProcess().showOpenPanel() {
                        imageData.url = openURL
                    }
                }, label: {
                    Image(systemName: "doc.badge.plus")
                })
                
                Button(action: {
                    saveImage()
                }, label: {
                    Image(systemName: "square.and.arrow.down")
                })
            }.padding()
        }
    }
    
    
    func saveImage() {
        let view = CoverImageView().environmentObject(imageData)
        let imageData = view.asPngData(rect: CGRect.init(x: 0, y: 0, width: 1024, height: 768))
        if let url = ImageProcess().saveURL() {
            try? imageData!.write(to: url)
        }
    }
    
    func saveImageToApp(data: Data) {
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let url = documents.appendingPathComponent("example.png")
        do {
            try data.write(to: url)
        } catch {
            print("Unable to Write Image Data to Disk")
        }
    }
}

struct PhotoTestView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoTestView()
    }
}




