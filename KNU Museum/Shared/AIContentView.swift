//
//  AIContentView.swift
//  KNU Museum
//
//  Created by 윤성환 on 2022/05/25.
//

import SwiftUI
import UIKit

class AIPredict{
    
    var data = UIImage()
    @State private var classificationLabel: String = ""

    let model = Classifier()
    
    init(image : UIImage){
        self.data = image
    }
        
    func classifyImage() -> String {
        let image = self.data
        let resizedImage = image.resizeImageTo(size:CGSize(width: 299, height: 299))

        let buffered_image = resizedImage!.buffer(Width:299,Height:299,from:resizedImage!)
        let output = try! model.prediction(image: buffered_image!)
        
        print(output.classLabelProbs)
        return output.classLabel
        }
        
}

extension UIImage {
    func buffer(Width : Int, Height : Int, from image: UIImage) -> CVPixelBuffer? {
      let attrs = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue, kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
      var pixelBuffer : CVPixelBuffer?
      let status = CVPixelBufferCreate(kCFAllocatorDefault, Int(Width), Int(Height), kCVPixelFormatType_32BGRA, attrs, &pixelBuffer)
      guard (status == kCVReturnSuccess) else {
        return nil
      }

      CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
      let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer!)

      let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
      let context = CGContext(data: pixelData, width: Int(Width), height: Int(Height), bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer!), space: rgbColorSpace, bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)

        context?.translateBy(x: 0, y: CGFloat(Height))
      context?.scaleBy(x: 1.0, y: -1.0)

      UIGraphicsPushContext(context!)
        image.draw(in: CGRect(x: 0, y: 0, width: Width, height: Height))
      UIGraphicsPopContext()
      CVPixelBufferUnlockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))

      return pixelBuffer
    }
}
