//
//  OpenAndSaveImageTestApp.swift
//  OpenAndSaveImageTest
//
//  Created by Runhua Huang on 2022/1/23.
//

import SwiftUI

@main
struct OpenAndSaveImageTestApp: App {
    var body: some Scene {
        WindowGroup {
            PhotoTestView().environmentObject(ImageData())
        }
        .commands {
            ImportFromDevicesCommands()
        }
    }
}
