//
//  SettingsView.swift
//  CacheImagesInSwiftUI
//
//  Created by Ульяна Гритчина on 16.07.2022.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var vm = SettingsViewViewModel()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                CustomButton(title: "NSCache",
                             color: vm.type == .nsCache ? .blue : .gray,
                             action: {vm.setType(.nsCache)})
                
                CustomButton(title: "File Manager",
                             color: vm.type == .fileManager ? .blue : .gray,
                             action: {vm.setType(.fileManager)})
                Spacer()
                
                
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
