//
//  KDTOutfitStudioLogoView.swift
//  KDTOutfitStudio
//
//  Created by Mr. Kavinda Dilshan on 2022-07-13.
//

import SwiftUI

struct KDTOutfitStudioLogoView: View {
    
    // MARK: PROPERTIES
    @EnvironmentObject var colorPalette: ColorPalette
    
    // MARK: BODY
    var body: some View {
        ZStack {
            Rectangle()
                .fill(colorPalette.grey3)
                .edgesIgnoringSafeArea(.all)
            
            Image("KDTOutfitStudioLogo2")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(.leading, 60)
                .padding(.top, 30)
        }
    }
}

// MARK: PREVIEWS
struct KDTOutfitStudioLogoView_Previews: PreviewProvider {
    static var previews: some View {
        KDTOutfitStudioLogoView()
            .previewInterfaceOrientation(.landscapeLeft)
            .environmentObject(ColorPalette())
    }
}
