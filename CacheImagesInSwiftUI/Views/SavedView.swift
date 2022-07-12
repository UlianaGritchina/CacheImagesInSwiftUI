//
//  SavedImageView.swift
//  CacheImagesInSwiftUI
//
//  Created by Ульяна Гритчина on 11.07.2022.
//

import SwiftUI

struct SavedView: View {
    @State private var image: UIImage? = CahceManager.instance.get(name: "saved")
    @State private var isShowing = false
    var body: some View {
        NavigationView {
            VStack {
                
                Spacer()
                
                ZStack {
                    if let image = image {
                        ImageView(image: image)
                    } else {
                        NoImageView()
                    }
                    
                    MessageView(text: "Deleted",
                                isShowingMassage: isShowing)
                }
                
                Spacer()
                
                CustomButton(
                    tile: "Delete",
                    color: .purple,
                    action: {
                        
                        isShowing = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            self.isShowing = false
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            CahceManager.instance.remove(name: "saved")
                            self.image = CahceManager.instance.get(name: "saved")
                        }
                        
                        
                    }
                )
                
            }
            .navigationTitle("Saved")
        }
        .onAppear {
            image = CahceManager.instance.get(name: "saved")
        }
    }
}

struct SavedImageView_Previews: PreviewProvider {
    static var previews: some View {
        SavedView()
    }
}
