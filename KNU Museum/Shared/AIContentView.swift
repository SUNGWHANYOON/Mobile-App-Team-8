//
//  AIContentView.swift
//  KNU Museum
//
//  Created by 윤성환 on 2022/05/25.
//

import SwiftUI
import UIKit
<<<<<<< HEAD
=======
import Vision
import CoreML
import CoreImage
>>>>>>> 70068798763db9c64dc61a37dc0ec11e4fd703cd

class AIPredict{
    
    var data = UIImage()
<<<<<<< HEAD
    @State private var classificationLabel: String = ""

    let model = Classifier1()
=======
>>>>>>> 70068798763db9c64dc61a37dc0ec11e4fd703cd
    
    init(image : UIImage){
        self.data = image
    }
<<<<<<< HEAD
        
    func classifyImage() -> String {
        let image = self.data
        let resizedImage = image.resizeImageTo(size:CGSize(width: 299, height: 299))

        let buffered_image = resizedImage!.buffer(Width:299,Height:299,from:resizedImage!)
        let output = try! model.prediction(image: buffered_image!)
        
        print(output.classLabelProbs)
        return String(Int(arc4random()%10))
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
=======
    
    func classifyImage() -> String {
        
        return detect(image1: self.data)
    }
    
    func detect(image1: UIImage?) -> String {
        
        var finalResults: String = "-1"
        
        guard let buffer = image1?.resize(to: CGSize(width: 299, height: 299))?
            .pixelBuffer() else {
            fatalError("Buffer Conversion Error")
        }
        
        do {
            let config = MLModelConfiguration()
            let model = try Classifier(configuration: config)
            
            let input = ClassifierInput(image: buffer)
            
            let output = try model.prediction(input: input)
            let text = output.classLabel
            finalResults = text
        } catch {
            print(error.localizedDescription)
        }
        
        return finalResults
        
        
//        var finalResults: String = "-1"
//
//        let config = MLModelConfiguration()
//        guard let model = try? Classifier(configuration: config) else {
//            fatalError("Loading CoreML Model Failed.")
//        }
//
//        guard let buffer = image1.convertToBuffer() else {
//            fatalError("Converting to Buffer Failed.")
//        }
//
//        print(buffer)
//
//        let input = ClassifierInput(image: buffer)
//
//        do {
//            let output = try model.prediction(input: input)
//            finalResults = output.classLabel
//        } catch {
//            fatalError(String(describing: error))
//        }
//        return finalResults
    }
}



>>>>>>> 70068798763db9c64dc61a37dc0ec11e4fd703cd
