//
//  NavigationBarView.swift
//  KDTOutfitStudio
//
//  Created by Mr. Kavinda Dilshan on 2022-07-08.
//

import SwiftUI

struct NavigationBarView: View {
    
    // MARK: PROPERTIES
    @EnvironmentObject var colorPalette: ColorPalette
    
    let action: () -> Void
    let navigationButtonSpacing: CGFloat = 19
    
    // MARK: BODY
    var body: some View {
        HStack(spacing: navigationButtonSpacing) {
            Button {
                action()
            } label: {
                Image("KDTOutfitStudioLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 125)
                    .offset(x: 0, y: -2)
            }
            
            HStack(spacing: navigationButtonSpacing) {
                Button("Outfits") { }
                
                Button("Shirts") { }
                
                Button("T-Shirts") { }
                
                Button("Vests") { }
                
                Button("Suits") { }
                
                Button("Tank-tops") { }
                
                Button("Hoodies") { }
                
                Rectangle()
                    .fill(colorPalette.grey1)
                    .frame(width: 1, height: 15)
            }
            
            HStack(spacing: navigationButtonSpacing) {
                Button("Trousers") { }
                
                Button("Jeans") { }
                
                Button("Shorts") { }
                
                Button("Underpants") { }
                
                Rectangle()
                    .fill(colorPalette.grey1)
                    .frame(width: 1, height: 15)
            }
            
            HStack(spacing: navigationButtonSpacing) {
                Button("Socks") { }
                
                Button("Shoes") { }
                
                Button("Flip-flops") { }
                
                Rectangle()
                    .fill(colorPalette.grey1)
                    .frame(width: 1, height: 15)
            }
            
            HStack(spacing: navigationButtonSpacing) {
                Button("Belts") { }
                
                Button("Jewelries") { }
                
                Button("Watches") { }
                
                Button("Caps") { }
            }
        }
        .foregroundColor(colorPalette.grey1)
        .font(.footnote)
        .frame(maxWidth: .infinity)
        .padding(.top, 10)
        .padding(.bottom, 18)
        .background(colorPalette.black1)
    }
}

// MARK: PREVIEWS
struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView { }
            .previewInterfaceOrientation(.landscapeLeft)
            .environmentObject(ColorPalette())
    }
}
