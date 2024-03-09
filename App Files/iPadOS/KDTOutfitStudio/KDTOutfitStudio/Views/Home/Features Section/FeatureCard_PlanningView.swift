//
//  FeatureCard_PlanningView.swift
//  KDTOutfitStudio
//
//  Created by Mr. Kavinda Dilshan on 2022-07-10.
//

import SwiftUI

struct FeatureCard_PlanningView: View {
    
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
                    Text("Planning")
                        .foregroundColor(colorPalette.black2)
                        .font(.system(size: 28).weight(.bold))
                        .padding(.bottom, 2)
                    
                    Text("Make your next outfit by selecting items\none by one from different categories.")
                        .kerning(-0.2)
                        .font(.system(size: 10).weight(.semibold))
                        .foregroundColor(colorPalette.black1)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    NavigationLink {
                        // link to another view goes here...
                    } label: {
                        HStack {
                            Text("Planning")
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
                .offset(x: 114, y: -60)
                
                Image("Icon4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 206)
                    .shadow(color: .black.opacity(0.15), radius: 5,x: -4, y: 4)
                    .offset(x: -108, y: -106)
                
                HStack(spacing: 20) {
                    Image("Icon5")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 208)
                        .shadow(color: .black.opacity(0.15), radius: 5,x: -6, y: 6)
                    
                    Image("Icon6")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 92)
                }
                .offset(x: 20, y: 70)
            }
            .padding(.top)
    }
}

// MARK: PREVIEWS
struct FeatureCard_PlanningView_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard_PlanningView()
            .environmentObject(ColorPalette())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
