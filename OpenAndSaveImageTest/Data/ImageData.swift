//
//  ImageData.swift
//  DevicesCaseScreenshot
//
//  Created by Runhua Huang on 2022/1/23.
//

import Foundation
import SwiftUI

class ImageData: NSObject, ObservableObject {
    @Published var imagedata: Data = Data()
    @Published var imageName: String = ""
}
