//
//  SavedImageView.swift
//  CacheImagesInSwiftUI
//
//  Created by Ульяна Гритчина on 11.07.2022.
//

import SwiftUI

struct SavedView: View {
    @StateObject private var vm = SavedViewViewModel()
    var body: some View {
        NavigationView {
            VStack {
                
                Spacer()
                
                ZStack {
                    if let image = vm.image {
                        ImageView(image: image)
                    } else {
                        NoImageView()
                    }
                    
                    MessageView(text: "Deleted",
                                isShowingMassage: vm.isShowigMessages)
                }
                
                Spacer()
                
                CustomButton(
                    tile: "Delete",
                    color: .red,
                    action: { vm.delete() }
                )
                
            }
            .navigationTitle("Saved")
        }
        .onAppear {
            vm.fetchImage()
        }
    }
}

struct SavedImageView_Previews: PreviewProvider {
    static var previews: some View {
        SavedView()
    }
}
