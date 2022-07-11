//
//  ContentView.swift
//  CacheImagesInSwiftUI
//
//  Created by Ульяна Гритчина on 11.07.2022.
//

import SwiftUI

struct ImageView: View {
    @StateObject private var vm = ImageViewViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    
                    Spacer()
                    
                    switch vm.networkState {
                    case .loaded: ZStack {
                        DowloadedImageView(image: vm.image)
                        SaveMessageView(isShowingMassage: vm.isShowingSavedMassage)
                    }
                    case .loadingError: NoImageView()
                    case .loading: ProgressView()
                    }
                    
                    Spacer()
                    
                    HStack {
                        CustomButton(tile: "Dowload new",
                                     color: .green,
                                     action: vm.fetchImage)
                        
                        CustomButton(tile: "Save",
                                     color: .blue,
                                     action: vm.showSaveMassage)
                    }
                    
                }
                .navigationTitle("Cache in SwftUI")
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}


