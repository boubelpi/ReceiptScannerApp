//
//  PhotoOfReceiptView.swift
//  ReceiptScannerApp
//
//  Created by Pavel on 12/12/22.
//

import SwiftUI
import UIKit

struct PhotoOfReceiptView: View {
    @State private var retake_photo : String? = nil
    var im : UIImage?
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: ContentView(), tag : "K", selection: $retake_photo) {
                    
                }
                Image(uiImage: im!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Rectangle())
                    .frame(width:300,height:500)
                Text(recogn(im!))
                Button("Add to the list of receipts") {
                    
                }.padding()
                Button("Take another photo") {
                    retake_photo = "K"
                    twt = ""
                }
            }
        }
    }
}

struct PhotoOfReceiptView_Previews: PreviewProvider {
    static var previews: some View {
        let ima = UIImage(systemName: "heart.fill")
        PhotoOfReceiptView(im: ima)
    }
}
