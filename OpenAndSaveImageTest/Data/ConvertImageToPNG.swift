//
//  ConvertImageToPNG.swift
//  DevicesCaseScreenshot
//
//  Created by Runhua Huang on 2022/1/23.
//

import Foundation
import SwiftUI

struct ImageProcess {
    func showOpenPanel() -> URL? {
        let openPanel = NSOpenPanel()
        openPanel.allowedContentTypes = [.image]
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseDirectories = false
        openPanel.canChooseFiles = true
        let response = openPanel.runModal()
        return response == .OK ? openPanel.url : nil
    }
    
    
    func saveURL() -> URL? {
        let savePanel = NSSavePanel()
        savePanel.allowedContentTypes = [.png]
        savePanel.canCreateDirectories = true
        savePanel.isExtensionHidden = false
        savePanel.allowsOtherFileTypes = false
        savePanel.title = "Save your image"
        savePanel.message = "Choose a folder and a name to store your image."
        savePanel.nameFieldLabel = "File name:"
        let response = savePanel.runModal()
        return response == .OK ? savePanel.url : nil
    }
    
    func saveImage() {
        let view = CoverImageView().environmentObject(ImageData())
        let imageData = view.asPngData(rect: CGRect.init(x: 0, y: 0, width: 1024, height: 768))
        if let url = saveURL() {
            try? imageData!.write(to: url)
        }
         // print(imageData)
    }
}
