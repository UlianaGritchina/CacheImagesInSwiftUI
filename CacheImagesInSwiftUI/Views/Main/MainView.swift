//
//  ContentView.swift
//  CacheImagesInSwiftUI
//
//  Created by Ульяна Гритчина on 11.07.2022.
//

import SwiftUI

struct MainView: View {
    @StateObject private var vm = MainViewViewModel()
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                content
                
                Spacer()
                
                HStack {
                    CustomButton(title: "Download new",
                                 color: .green,
                                 action: vm.downloadNewImage)
                    
                    CustomButton(title: "Save",
                                 color: .blue,
                                 action: {vm.saveImage()})
                }
                .padding()
                
            }
            .navigationTitle(vm.title)
            
            .onAppear {
                vm.setupView()
            }
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

extension MainView {
    
    var content: some View  {
        VStack {
            switch vm.networkState {
            case .loaded: loadedPhoto
            case .loadingError: NoImageView()
            case .loading: ProgressView()
            }
        }
    }
    
    var loadedPhoto: some View {
        ZStack {
            ImageView(image: vm.image)
            MessageView(text: "Saved",
                        isShowingMassage: vm.isShowingSavedMassage)
        }
    }
    
}
