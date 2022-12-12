//
//  StartView.swift
//  ReceiptScannerApp
//
//  Created by Pavel on 11/12/22.
//

import SwiftUI

struct StartView: View {
    @State private var download_receipt : String? = nil
    @State private var receive_list_of_receipts : String? = nil
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello!")
                    .font(.title)
                NavigationLink(destination: ContentView(), tag : "A", selection: $download_receipt) {}
                NavigationLink(destination: ReceiptsView(), tag : "B", selection: $receive_list_of_receipts) {}
                Button("Download new receipt") {
                    download_receipt = "A"
                    receive_list_of_receipts = nil
                }.padding()
                Button("Load the list of receipts") {
                    download_receipt = nil
                    receive_list_of_receipts = "B"
                }
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
