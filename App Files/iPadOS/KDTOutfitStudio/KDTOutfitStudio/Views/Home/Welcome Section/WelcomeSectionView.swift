//
//  WelcomeSectionView.swift
//  KDTOutfitStudio
//
//  Created by Mr. Kavinda Dilshan on 2022-07-08.
//

import SwiftUI

struct WelcomeSectionView: View {
    
    // MARK: PROPERTIES
    @EnvironmentObject var colorPalette: ColorPalette
    
    let action: () -> Void
    
    // MARK: BODY
    var body: some View {
        VStack(spacing: 10) {
            Text("Welcome to the\nnext generation outfit organizing.")
                .foregroundColor(colorPalette.black2)
                .font(.system(size: 45).weight(.semibold))
                .multilineTextAlignment(.center)
            
            Button {
                action()
            } label: {
                HStack(alignment: .bottom) {
                    Text("Scroll down to get started")
                    
                    Image(systemName: "chevron.down")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 12)
                        .offset(x: 0, y: -5)
                        .font(.body.weight(.medium))
                }
                .foregroundColor(colorPalette.blue1)
            }
            
            Image("SampleWardrobe")
                .resizable()
                .scaledToFit()
                .padding()
                .overlay(alignment: .leading) {
                    Rectangle()
                        .fill(.white)
                        .frame(width: 100)
                        .blur(radius: 6)
                }
                .overlay(alignment: .trailing) {
                    Rectangle()
                        .fill(.white)
                        .frame(width: 100)
                        .blur(radius: 6)
                }
                .padding(.horizontal, 80)
            
            Text("Preview - KDT Outfit Studio(Dressing Room)")
                .font(.caption2)
                .foregroundColor(.secondary)
        }
    }
}

// MARK: PREVIEWS
struct WelcomeSectionView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeSectionView { }
            .environmentObject(UnwornItemsViewModel())
            .environmentObject(ColorPalette())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
