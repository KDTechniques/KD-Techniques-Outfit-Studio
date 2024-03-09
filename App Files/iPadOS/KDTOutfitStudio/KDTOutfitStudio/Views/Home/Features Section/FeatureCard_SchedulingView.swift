//
//  FeatureCard_SchedulingView.swift
//  KDTOutfitStudio
//
//  Created by Mr. Kavinda Dilshan on 2022-07-10.
//

import SwiftUI

struct FeatureCard_SchedulingView: View {
    
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
                    Text("Scheduling")
                        .foregroundColor(colorPalette.black2)
                        .font(.system(size: 28).weight(.bold))
                        .padding(.bottom, 2)
                    
                    Text("Reserve your outfits for later.\nSo you can pick and dress yourself up\nquickly for different occasions.")
                        .kerning(-0.2)
                        .font(.system(size: 10).weight(.semibold))
                        .foregroundColor(colorPalette.black1)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    NavigationLink {
                        // link to another view goes here...
                    } label: {
                        HStack {
                            Text("Schedule")
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
                .offset(x: 119, y: 60)
                
                Image("Icon7")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 180)
                    .shadow(color: .black.opacity(0.15), radius: 5, x: -5, y: 5)
                    .offset(x: -28, y: -100)
                
                Image("Icon8")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 153)
                    .shadow(color: .black.opacity(0.15), radius: 5, x: -5, y: 5)
                    .offset(x: -106, y: 90)
            }
            .padding(.top)
    }
}

// MARK: PREVIEWS
struct FeatureCard_SchedulingView_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard_SchedulingView()
            .environmentObject(ColorPalette())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
