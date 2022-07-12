//
//  ContentView.swift
//  CacheImagesInSwiftUI
//
//  Created by Ульяна Гритчина on 11.07.2022.
//

import SwiftUI

struct CacheInSwiftUIView: View {
    @StateObject private var vm = CacheInSwftUIViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    
                    Spacer()
                    
                    switch vm.networkState {
                    case .loaded: ZStack {
                        ImageView(image: vm.image)
                        MessageView(text: "Saved",
                                    isShowingMassage: vm.isShowingSavedMassage)
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
                                     action: vm.saveImage)
                    }
                    
                }
                .navigationTitle("Cache in SwftUI")
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CacheInSwiftUIView()
    }
}


