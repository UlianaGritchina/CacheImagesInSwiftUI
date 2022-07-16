//
//  SettingsView.swift
//  CacheImagesInSwiftUI
//
//  Created by Ульяна Гритчина on 16.07.2022.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var vm = SettngsViewViewModel()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                CustomButton(title: "NSCache",
                             color: vm.tapy == .nsCache ? .blue : .gray,
                             action: {vm.chouse(.nsCache)})
                
                CustomButton(title: "File Manager",
                             color: vm.tapy == .fileManager ? .blue : .gray,
                             action: {vm.chouse(.fileManager)})
                Spacer()
                CustomButton(
                    title: "Confitm",
                    color: .green,
                    action: {
                        vm.setTapy()
                        dismiss()
                    },
                    width: UIScreen.main.bounds.width - 80)
                    .padding()
                
            }
            .navigationTitle("Settings")
            .toolbar { Button("Cancel", action: { dismiss()} ) }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
