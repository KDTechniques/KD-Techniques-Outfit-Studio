//
//  UnwornItemsSectionView.swift
//  KDTOutfitStudio
//
//  Created by Mr. Kavinda Dilshan on 2022-07-08.
//

import SwiftUI

struct UnwornItemsSectionView: View {
    
    // MARK: PROPERTIES
    @EnvironmentObject var colorPalette: ColorPalette
    
    // MARK: BODY
    var body: some View {
        VStack(spacing: 10) {
            Text("You have unworn items\nin the wardrobe.")
                .foregroundColor(colorPalette.black2)
                .multilineTextAlignment(.center)
                .font(.system(size: 45).weight(.semibold))
            
            Text("Do you wanna check 'em out?")
                .font(.system(size: 36).weight(.semibold))
                .foregroundColor(colorPalette.Red1)
            
            NavigationLink {
                // link to another view goes here...
            } label: {
                HStack(alignment: .bottom) {
                    Text("Show unworn items")
                    
                    Image(systemName: "chevron.right")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 10)
                        .offset(x: 0, y: -5)
                        .font(.body.weight(.medium))
                }
                .foregroundColor(colorPalette.blue1)
            }
            
            // unworn items slider goes here
            UnwornItemsSliderView()
                .padding(.top)
            
            Text("Preview - Unworn Items")
                .font(.caption2)
                .foregroundColor(.secondary)
                .padding(.bottom, 10)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(.ultraThinMaterial)
    }
}

// MARK: PREVIEWS
struct UnwornItemsSectionView_Previews: PreviewProvider {
    static var previews: some View {
        UnwornItemsSectionView()
            .environmentObject(UnwornItemsViewModel())
            .environmentObject(ColorPalette())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
