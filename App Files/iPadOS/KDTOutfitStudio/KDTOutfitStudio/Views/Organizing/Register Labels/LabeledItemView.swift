//
//  LabeledItemView.swift
//  KDTOutfitStudio
//
//  Created by Mr. Kavinda Dilshan on 2022-07-14.
//

import SwiftUI

struct LabeledItemView: View {
    
    // MARK: PROPERTIES
    @EnvironmentObject var organizingVM: OrganizingViewModel
    @EnvironmentObject var colorPelette: ColorPalette
    
    let label: String
    let labelID: String
    
    // MARK: BODY
    var body: some View {
        VStack {
            Image(label)
                .resizable()
                .scaledToFit()
                .frame(height: 125)
            
            Text(labelID)
                .font(.system(size: 11.44))
                .foregroundColor(colorPelette.black1)
                .frame(width: 84, height: 28)
                .background(colorPelette.grey5)
                .cornerRadius(.infinity)
                .padding(.top)
        }
    }
}

// MARK: PREVIEWS
struct LabeledItemView_Previews: PreviewProvider {
    static var previews: some View {
        LabeledItemView(label: "Shoe3", labelID: "SN 03")
            .previewInterfaceOrientation(.landscapeLeft)
            .environmentObject(ColorPalette())
            .environmentObject(OrganizingViewModel())
    }
}
