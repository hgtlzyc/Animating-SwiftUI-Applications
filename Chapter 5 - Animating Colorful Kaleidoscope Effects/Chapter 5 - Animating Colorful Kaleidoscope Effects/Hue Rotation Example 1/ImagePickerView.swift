//
//  ImagePickerView.swift
//  Hue Rotation Example 1
//
//  Created by Stephen DeStefano on 1/10/23.
//

import SwiftUI

struct ImagePickerView: View {
    @Binding var selectedImage: String
    let images: [String] = ["ornament", "landscape", "dog", "dice", "cat"]
    
    var body: some View {
        Picker("", selection: $selectedImage) {
            ForEach(images, id: \.self) { value in
                Text(value)
                    .foregroundColor(.white)
            }
        }.pickerStyle(WheelPickerStyle())
        .frame(width: 300, height: 150)
        .background(Color.red.colorMultiply(.blue))
        .cornerRadius(20)
        .shadow(color: .white, radius: 5, x: 0, y: 0 )
    }
}

struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView(selectedImage: .constant("ornament"))
    }
}
