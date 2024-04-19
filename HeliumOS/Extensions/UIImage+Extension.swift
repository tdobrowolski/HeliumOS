//
//  UIImage+Extension.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 19/04/2024.
//  Copyright © 2024 Tobiasz Dobrowolski. All rights reserved.
//

import UIKit

extension UIImage {
    var averageColor: UIColor? {
        guard let inputImage = CIImage(image: self) else { return nil }
        
        let extentVector = CIVector(
            x: inputImage.extent.origin.x,
            y: inputImage.extent.origin.y,
            z: inputImage.extent.size.width,
            w: inputImage.extent.size.height
        )
        
        let ciFilterParameters = [
            kCIInputImageKey: inputImage,
            kCIInputExtentKey: extentVector
        ]
        
        guard let outputImage = CIFilter(
            name: "CIAreaAverage",
            parameters: ciFilterParameters
        )?.outputImage else {
            return nil
        }
        
        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [.workingColorSpace: kCFNull])
        
        context.render(
            outputImage,
            toBitmap: &bitmap,
            rowBytes: 4,
            bounds: .init(x: 0, y: 0, width: 1, height: 1),
            format: .RGBA8,
            colorSpace: nil
        )
        
        return UIColor(
            red: CGFloat(bitmap[0]) / 255,
            green: CGFloat(bitmap[1]) / 255,
            blue: CGFloat(bitmap[2]) / 255,
            alpha: CGFloat(bitmap[3]) / 255
        )
    }
}
