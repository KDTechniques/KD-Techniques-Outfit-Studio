//
//  ContentView.swift
//  KDTOutfitStudio
//
//  Created by Mr. Kavinda Dilshan on 2022-06-09.
//

import SwiftUI

struct HomeScreenView: View {
    
    // MARK: PROPERTIES
    @Binding var isLockScreenOn: Bool
    
    let screenWidth: CGFloat = UIScreen.main.bounds.size.width
    
    // MARK: BODY
    var body: some View {
        ZStack {
            ScrollView {
                ScrollViewReader { proxy in
                    WelcomeSectionView {
                        withAnimation(.easeInOut(duration: 1)) {
                            proxy.scrollTo(1, anchor: .center)
                        }
                    }
                    .padding(.top, 100)
                    .padding(.bottom, 40)
                    
                    UnwornItemsSectionView()
                    
                    FeaturesView()
                        .id(1)
                    
                    HStack(spacing: 0) {
                        Spacer()
                        FavouritesCardView()
                        Spacer()
                        VirtualSuitcaseCardView()
                        Spacer()
                    }
                    .padding(.top, 15)
                    .padding(.bottom, 2)
                }
            }
            
            VStack {
                NavigationBarView {
                    isLockScreenOn.toggle()
                }
                
                Spacer()
            }
            .overlay {
                VStack {
                    HStack {
                        Spacer()
                        SearchNVSCFloatingButtonView()
                    }
                    .padding(.trailing, 30)
                    Spacer()
                }
                .padding(.top, 150)
            }
            .navigationTitle("Home")
        }
        .navigationBarHidden(true)
    }
}

// MARK: PREVIEWS
struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView(isLockScreenOn: .constant(false))
            .environmentObject(UnwornItemsViewModel())
            .environmentObject(ColorPalette())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
