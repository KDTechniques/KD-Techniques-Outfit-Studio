//
//  FeatureCard_PhotographyView.swift
//  KDTOutfitStudio
//
//  Created by Mr. Kavinda Dilshan on 2022-07-10.
//

import SwiftUI

struct FeatureCard_PhotographyView: View {
    
    // MARK: PROPERTIRS
    @EnvironmentObject var colorPalette: ColorPalette
    
    let cardWidth: CGFloat = 482
    let cardHeight: CGFloat = 286
    
    // MARK: BODY
    var body: some View {
        Rectangle()
            .fill(colorPalette.grey3)
            .frame(width: cardWidth, height: cardHeight)
            .cornerRadius(15)
            .overlay {
                VStack(alignment: .leading, spacing: 0) {
                    Image("Icon1")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 206)
                        .shadow(color: .black.opacity(0.15), radius: 5, x: -6, y: 6)
                        .padding(.bottom, 30)
                    
                    Text("Photography")
                        .foregroundColor(colorPalette.black2)
                        .font(.system(size: 28).weight(.bold))
                        .padding(.bottom, 2)
                    
                    Text("Take photos of the items to store them in the outfits library.\nSo it may help you organize properly.")
                        .kerning(-0.2)
                        .font(.system(size: 10).weight(.semibold))
                        .foregroundColor(colorPalette.black1)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    NavigationLink {
                       // link to another view goes here...
                    } label: {
                        HStack {
                            Text("Photography")
                                .font(.system(size: 14).weight(.medium))
                            
                            Image(systemName: "chevron.right")
                                .font(.system(size: 12).weight(.medium))
                            
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(.blue)
                        .cornerRadius(5)
                    }
                    .padding(.top)
                }
                .offset(x: -66, y: -60)
                
                Rectangle()
                    .fill(.clear)
                    .frame(width: cardWidth, height: cardHeight)
                    .overlay {
                        Image("Icon2")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 236)
                            .rotationEffect(.degrees(112))
                            .shadow(color: .black.opacity(0.15), radius: 5, x: -6, y: 6)
                            .offset(x: 175,y: 35)
                    }
                    .cornerRadius(15)
                    .clipped()
            }
            .padding(.top)
    }
}

// MARK: PREVIEWS
struct FeatureCard_PhotographyView_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard_PhotographyView()
            .environmentObject(ColorPalette())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
