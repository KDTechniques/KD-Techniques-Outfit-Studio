//
//  FeatureCard_OrganizingView.swift
//  KDTOutfitStudio
//
//  Created by Mr. Kavinda Dilshan on 2022-07-10.
//

import SwiftUI

struct FeatureCard_OrganizingView: View {
    
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
                    Text("Organizing")
                        .foregroundColor(colorPalette.black2)
                        .font(.system(size: 28).weight(.bold))
                        .padding(.bottom, 2)
                    
                    Text("Organize items into related categories properly.\nSo it may help you find it quickly.")
                        .kerning(-0.2)
                        .font(.system(size: 10).weight(.semibold))
                        .foregroundColor(colorPalette.black1)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    NavigationLink {
                        OrganizingRootView()
                    } label: {
                        HStack {
                            Text("Organizing")
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
                .offset(x: -95, y: -60)
                
                Rectangle()
                    .fill(.clear)
                    .frame(width: cardWidth, height: cardHeight)
                    .overlay {
                        Image("Icon3")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 432)
                            .offset(x: 100,y: 5)
                    }
                    .cornerRadius(15)
                    .clipped()
            }
            .padding(.top)
    }
}

// MARK: PREVIEWS
struct FeatureCard_OrganizingView_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard_OrganizingView()
            .environmentObject(ColorPalette())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
