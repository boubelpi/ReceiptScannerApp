//
//  ContentView.swift
//  ReceiptScannerApp
//
//  Created by Pavel on 10/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    @State private var select : String? = nil
    var body: some View {
        NavigationView {
            VStack {
                Button {
                    if (selectedImage != nil) {select = "T"}
                }
            label: {
                Text("Add a receipt. After doing that, press this button").bold()
            }
                NavigationLink(destination: PhotoOfReceiptView(im : selectedImage).navigationBarBackButtonHidden(true), tag : "T", selection: $select) {}
                Button("Take new photo") {
                    self.sourceType = .camera
                    self.isImagePickerDisplay.toggle()
                }.padding()
                
                Button("Select from library of photos") {
                    self.sourceType = .photoLibrary
                    self.isImagePickerDisplay.toggle()
            }
                .sheet(isPresented: self.$isImagePickerDisplay) {
                    ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.$sourceType)
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
