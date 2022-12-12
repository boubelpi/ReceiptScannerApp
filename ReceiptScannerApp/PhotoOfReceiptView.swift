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
    @State private var to_view_of_receipts : String? = nil
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true), tag : "K", selection: $retake_photo) {
                    
                }
                NavigationLink(destination: ReceiptsView().navigationBarBackButtonHidden(true), tag : "A", selection : $to_view_of_receipts) {}
                Image(uiImage: im!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Rectangle())
                    .frame(width:300,height:500)
                Text("Totale : \(twt)")
                Button("Add to the list of receipts") {
                    let m1 = 3.0
                    let m2 = "$"
                    total_sum += m1
                    ar.append(Receipt(cost: m1, currency: m2))
                    to_view_of_receipts = "A"
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
