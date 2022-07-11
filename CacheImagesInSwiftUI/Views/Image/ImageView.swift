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
            VStack {
                
                Spacer()
                
                switch vm.networkState {
                case .loaded: ContentView(image: vm.image)
                case .loadingError: NoImageView()
                case .loading: ProgressView()
                }
                
                Spacer()
                
                HStack {
                    CustomButton(tile: "Dowload new",
                                 color: .green,
                                 action: vm.fetchImage)
                    CustomButton(tile: "Save", color: .blue, action: {})
                }
                
            }
            .navigationTitle("Cache in SwftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}



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

struct ContentView: View {
    let image: Image?
    var body: some View {
        if let image = image {
            image
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.5), radius: 10, x: 5, y: 5)
        }
    }
}
