//
//  VirtualSuitcaseCardView.swift
//  KDTOutfitStudio
//
//  Created by Mr. Kavinda Dilshan on 2022-07-11.
//

import SwiftUI

struct VirtualSuitcaseCardView: View {
    
    // MARK: PROPERTIES
    @EnvironmentObject var colorPalette: ColorPalette
    
    let cardWidth: CGFloat = 651
    let cardHeight: CGFloat = 811
    
    // MARK: BODY
    var body: some View {
        Rectangle()
            .fill(colorPalette.grey3)
            .frame(width: cardWidth, height: cardHeight)
            .overlay {
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack(spacing: 10) {
                            Text("Virtual Suitcase")
                                .font(.system(size: 63).weight(.medium))
                            
                            Image("SuitCase")
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25)
                        }
                        .foregroundColor(colorPalette.black2)
                        
                        Text("Would you like to check your Virtual Suitcase right now?")
                            .foregroundColor(colorPalette.black1)
                            .font(.system(size: 23.5).weight(.medium))
                        
                        NavigationLink {
                            // link to another view goes here...
                        } label: {
                            HStack(alignment: .bottom) {
                                Text("Check your Virtual Suitcase")
                                
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 10)
                                    .offset(x: 0, y: -5)
                                    .font(.body.weight(.medium))
                            }
                            .foregroundColor(colorPalette.blue1)
                        }
                        
                        Spacer()
                    }
                    
                    Spacer()
                }
                .padding(35)
                
                Image("VSCIcon1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 411)
                    .offset(y: 105)
                    .shadow(color: .black.opacity(0.15), radius: 5, x: -6, y: 6)
            }
    }
}

// MARK: PREVIEWS
struct VirtualSuitcaseCardView_Previews: PreviewProvider {
    static var previews: some View {
        VirtualSuitcaseCardView()
            .environmentObject(ColorPalette())
            .previewInterfaceOrientation(.portrait)
    }
}
