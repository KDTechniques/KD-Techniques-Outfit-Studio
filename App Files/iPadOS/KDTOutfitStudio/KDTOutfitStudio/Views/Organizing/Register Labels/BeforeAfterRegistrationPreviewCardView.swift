//
//  BeforeAfterRegistrationPreviewCardView.swift
//  KDTOutfitStudio
//
//  Created by Mr. Kavinda Dilshan on 2022-07-14.
//

import SwiftUI

struct BeforeAfterRegistrationPreviewCardView: View {
    
    // MARK: PROPERTIES
    @EnvironmentObject var colorPalette: ColorPalette
    
    let text: String
    let color: Color
    
    // MARK: BODY
    var body: some View {
        VStack(spacing: 10) {
            VStack {
                Image("Shoe2")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 73)
                
                Text("SN 07")
                    .font(.system(size: 4))
                    .foregroundColor(colorPalette.black1)
                    .frame(width: 27, height: 9)
                    .background(color)
                    .cornerRadius(.infinity)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(colorPalette.grey3)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.1), radius: 3)
            
            Text(text)
                .font(.system(size: 7.76))
                .foregroundColor(colorPalette.black1)
        }
    }
}

// MARK: PREVIEWS
struct BeforeAfterRegistrationPreviewCardView_Previews: PreviewProvider {
    static var previews: some View {
        BeforeAfterRegistrationPreviewCardView(
            text: "Before registration",
            color: ColorPalette().green1
        )
        .previewInterfaceOrientation(.portrait)
        .environmentObject(ColorPalette())
        .environmentObject(OrganizingViewModel())
    }
}
