//
//  KDTOutfitStudioApp.swift
//  KDTOutfitStudio
//
//  Created by Mr. Kavinda Dilshan on 2022-06-09.
//

import SwiftUI

@main
struct KDTOutfitStudioApp: App {
    
    @StateObject var unwornItems = UnwornItemsViewModel.shared
    @StateObject var colorPalette = ColorPalette.shared
    @StateObject var organizing = OrganizingViewModel.shared
    
    init() {
        /// this will change the inline navigation bar title color when on .inline mode
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.clear]
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                LockScreenView()
            }
            .navigationViewStyle(.stack)
            .dynamicTypeSize(.large)
            .environmentObject(unwornItems)
            .environmentObject(colorPalette)
            .environmentObject(organizing)
        }
    }
}
