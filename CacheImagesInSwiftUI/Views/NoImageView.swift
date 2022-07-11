//
//  NoImageView.swift
//  CacheImagesInSwiftUI
//
//  Created by Ульяна Гритчина on 11.07.2022.
//

import SwiftUI

struct NoImageView: View {
    var body: some View {
        Text("?")
            .foregroundColor(.white)
            .bold()
            .font(.system(size: UIScreen.main.bounds.height / 7))
            .frame(width:UIScreen.main.bounds.width - 80,
                   height: UIScreen.main.bounds.height / 3)
            .background(Color.black.cornerRadius(20))
    }
}

struct NoImageView_Previews: PreviewProvider {
    static var previews: some View {
        NoImageView()
    }
}
