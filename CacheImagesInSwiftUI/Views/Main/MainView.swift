//
//  ContentView.swift
//  CacheImagesInSwiftUI
//
//  Created by Ульяна Гритчина on 11.07.2022.
//

import SwiftUI

struct MainView: View {
    @StateObject private var vm = CacheInSwftUIViewModel()
    var body: some View {
        NavigationView {
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
                    CustomButton(title: "Dowload new",
                                 color: .green,
                                 action: vm.dowloadNewImage)
                    
                    CustomButton(title: "Save",
                                 color: .blue,
                                 action: vm.saveImage)
                }
                .padding()
                
            }
            .navigationTitle("Cache in SwftUI")
            .sheet(isPresented: $vm.isShowingSettingsView, content: {
                SettingsView()
            })
            .toolbar {
                Button(action: {vm.showSettingsView()}) {
                    Image(systemName: "gearshape")
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


