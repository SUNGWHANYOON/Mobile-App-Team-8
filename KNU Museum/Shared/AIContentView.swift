//
//  AIContentView.swift
//  KNU Museum
//
//  Created by 윤성환 on 2022/05/25.
//

import SwiftUI
import UIKit
import Vision
import CoreML
import CoreImage

class AIPredict{
    
    var data = UIImage()
    
    init(image : UIImage){
        self.data = image
    }
    
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



