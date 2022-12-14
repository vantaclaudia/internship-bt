//
//  PhotoPicker.swift
//  EventHub
//
//  Created by Claudia Vanta on 05.12.2022.
//

import SwiftUI
import PhotosUI
import UIKit

struct PhotoPicker: View {
    @State private var selectedItem: [PhotosPickerItem] = []
    @Binding private var image: UIImage?
    
    init(image: Binding<UIImage?>) {
        self._image = image
    }
    
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
            }
            .background(Rectangle().frame(width: 414, height: 160).foregroundColor(Color("fadedBlack")).overlay(alignment: .bottom) {
                if let image = image {
                    Image(uiImage: image)
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
                        image = UIImage(data: data!)
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
    }
}
