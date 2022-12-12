//
//  ReceiptsView.swift
//  ReceiptScannerApp
//
//  Created by Pavel on 11/12/22.
//

import SwiftUI

struct ReceiptsView: View {
    var body: some View {
        VStack {
            Text("Your total for receipts is \(total_sum)")
            List(ar) {i in
                Text(String(i.cost) + i.currency)
            }
        }
    }
}

struct ReceiptsView_Previews: PreviewProvider {
    static var previews: some View {
        ReceiptsView()
    }
}
