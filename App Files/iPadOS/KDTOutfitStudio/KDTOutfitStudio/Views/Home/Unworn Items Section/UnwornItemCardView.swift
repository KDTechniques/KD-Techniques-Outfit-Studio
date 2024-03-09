//
//  UnwornItemCardView.swift
//  KDTOutfitStudio
//
//  Created by Mr. Kavinda Dilshan on 2022-07-08.
//

import SwiftUI

struct UnwornItemCardView: View {
    
    // MARK: PROPERTIES
    @EnvironmentObject var colorPalette: ColorPalette
    
    let scaleType: ScaleTypes
    let item: UnwornItemModel
    
    // MARK: BODY
    var body: some View {
        VStack(spacing: 0) {
            Image(item.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 350)
            
            Text("New")
                .font(.footnote)
                .foregroundColor(colorPalette.orange1)
                .padding(.top, 30)
                .padding(.bottom, 10)
            
            Text(item.itemName)
                .foregroundColor(colorPalette.black1)
                .font(.body.weight(.medium))
                .opacity(0.7)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 60)
            
            Text(item.categoryName.rawValue)
                .font(.caption2)
                .foregroundColor(.secondary)
                .padding(.top, scaleType == .scaleUp ? 30 : 20)
        }
        .offset(y: 10)
        .frame(width: 410, height: 550)
        .background(.white)
        .cornerRadius(50)
        .shadow(color: .black.opacity(0.1), radius: 2)
        .scaleEffect(scaleType == .scaleUp ? 1 : 0.7)
    }
}

// MARK: PREVIEWS
struct UnwornItemCardView_Previews: PreviewProvider {
    static var previews: some View {
        UnwornItemCardView(
            scaleType: .scaleUp,
            item: UnwornItemModel(
                imageName: "Shoe1",
                itemName: "Nike White Red KD 13",
                categoryName: .sneakers
            )
        )
        .previewInterfaceOrientation(.landscapeLeft)
        .environmentObject(ColorPalette())
    }
}
