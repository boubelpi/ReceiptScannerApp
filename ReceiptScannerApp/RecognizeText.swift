//
//  RecognizeText.swift
//  ReceiptScannerApp
//
//  Created by Pavel on 12/12/22.
//

import UIKit
import Vision

var twt = ""

func recogn(_ image : UIImage) {
    
    if let cgImage = image.cgImage {
        let requestHandler = VNImageRequestHandler(cgImage: cgImage)
        
        let recognizeTextRequest = VNRecognizeTextRequest {
            (request, error) in
            guard let observations = request.results as? [VNRecognizedTextObservation] else {
                return
            }
            
            let recognizedStrings = observations.compactMap { observation in
                observation.topCandidates(1).first?.string
            }
            
            DispatchQueue.main.async {
                if (recognizedStrings.count > 0) {
                    for i in recognizedStrings {
                        twt += i + " "
                    }
                }
                print(twt)
            }
        }
        
        recognizeTextRequest.recognitionLevel = .fast
        
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try requestHandler.perform([recognizeTextRequest])
            } catch {
                fatalError("runtime error") //should we have runtime error?
            }
        }
    }
}
func return_twt(_ im : UIImage?) -> String {
    recogn(im!)
    let totale = get_total(twt)
    if (totale == nil) {return ""}
    else {return String(totale!)}
}
