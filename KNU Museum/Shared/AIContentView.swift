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
        
    }
}



