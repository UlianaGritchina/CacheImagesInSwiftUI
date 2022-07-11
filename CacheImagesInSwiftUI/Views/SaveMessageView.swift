//
//  SaveMassageView.swift
//  CacheImagesInSwiftUI
//
//  Created by Ульяна Гритчина on 11.07.2022.
//

import SwiftUI

struct SaveMessageView: View {
    let isShowingMassage: Bool
    var body: some View {
        Rectangle()
            .opacity(0.5)
            .background(.ultraThinMaterial)
            .frame(width: UIScreen.main.bounds.width / 2,
                   height: UIScreen.main.bounds.width / 2)
            .cornerRadius(10)
            .overlay(
                Text("Saved")
                    .bold()
                    .foregroundColor(.white)
                    .font(.system(size: UIScreen.main.bounds.height / 30))
            )
            .opacity(isShowingMassage ? 1 : 0)
            .animation(.default, value: isShowingMassage)
    }
}

struct SaveMassageView_Previews: PreviewProvider {
    static var previews: some View {
        SaveMessageView(isShowingMassage: true)
    }
}
