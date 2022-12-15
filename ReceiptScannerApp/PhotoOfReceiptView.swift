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
    @State private var repeat_it: String? = nil
    var body: some View {
        NavigationView {
            VStack {
                Button{
                    repeat_it = "O"
                }
            label: {
                Text("Count total cost").bold().font(.title).foregroundColor(.white)
            }.background(.black)
                NavigationLink(destination : PhotoOfReceiptView(im:im!).navigationBarBackButtonHidden(true),tag : "O", selection: $repeat_it) {
                    
                }
                NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true), tag : "K", selection: $retake_photo) {
                    
                }
                NavigationLink(destination: ReceiptsView().navigationBarBackButtonHidden(true), tag : "A", selection : $to_view_of_receipts) {}
                Image(uiImage: im!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Rectangle())
                    .frame(width:300,height:500)
                Text("Totale : \(return_twt(im!))")
                Button("Add to the list of receipts") {
                    twt = ""
                    if (receipt == nil) {return}
                    let m1 = receipt!
                    let m2 = "$"
                    total_sum += m1
                    ar.append(Receipt(cost: m1, currency: m2))
                    to_view_of_receipts = "A"
                }.padding()
                Button("Take another photo") {
                    retake_photo = "K"
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
