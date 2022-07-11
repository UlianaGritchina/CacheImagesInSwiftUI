//
//  CustomButton.swift
//  CacheImagesInSwiftUI
//
//  Created by Ульяна Гритчина on 11.07.2022.
//

import SwiftUI

struct CustomButton: View {
    let tile: String
    let color: Color
    let action: () -> ()
    var body: some View {
        Button(action: action) {
            Text(tile)
                .foregroundColor(.white)
                .bold()
                .frame(width: UIScreen.main.bounds.width / 2.5,
                       height: UIScreen.main.bounds.height / 20)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(color)
                )
        }
        .padding()
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(tile: "title", color: .blue, action: {})
    }
}
