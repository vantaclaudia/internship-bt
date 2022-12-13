//
//  PhotoPicker.swift
//  EventHub
//
//  Created by Claudia Vanta on 05.12.2022.
//

import SwiftUI
import PhotosUI

struct PhotoPicker: View {
    @State var selectedItem: [PhotosPickerItem] = []
    @State var data: Data?
//    @Binding var image: UIImage
    
//    init(image: UIImage) {
//        self.image = image
//    }
    
    var body: some View {
        VStack {
            PhotosPicker (
                selection: $selectedItem,
                maxSelectionCount: 1,
                matching: .images
            ) {
                HStack {
                    Image(systemName: "camera.fill")
                    Text("Selectează")
                }
                .foregroundColor(Color.white).font(.system(size: 13)).bold()
                .background(Rectangle().frame(width: 112, height: 36).foregroundColor(Color.black).opacity(0.4)
                    .cornerRadius(8))
//                .position(x: 320, y: 50)
//                .position(x: 325, y: 430)
//                .offset(x: 130,y: 50)
            }
            .background(Rectangle().frame(width: 414, height: 160).foregroundColor(Color("fadedBlack")).overlay(alignment: .bottom) {
                if let data = data, let uiimage = UIImage(data: data) {
                    Image(uiImage: uiimage)
                        .resizable()
                        .frame(width: 414, height: 160)
                }
            })
            .onChange(of: selectedItem) { newValue in
                guard let item = selectedItem.first else {
                    return
                }
                item.loadTransferable(type: Data.self) { result in
                    switch result {
                    case .success(let data):
                        if let data = data {
                            self.data = data
                        } else {
                            print("Data is nil")
                        }
                    case .failure(let failure):
                        fatalError("\(failure)")
                    }
                }
            }
        }
    }
}

struct PhotoPicker_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPicker()
    }
}
