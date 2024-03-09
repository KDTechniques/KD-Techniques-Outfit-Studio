//
//  FavouritesCardView.swift
//  KDTOutfitStudio
//
//  Created by Mr. Kavinda Dilshan on 2022-07-10.
//

import SwiftUI

struct FavouritesCardView: View {
    
    // MARK: PROPERTIES
    @EnvironmentObject var colorPalette: ColorPalette
    
    let cardWidth: CGFloat = 651
    let cardHeight: CGFloat = 811
    
    @State private var icon1RotationValue: CGFloat = 0
    @State private var icon2RotationValue: CGFloat = 0
    
    // MARK: BODY
    var body: some View {
        Rectangle()
            .fill(colorPalette.grey3)
            .frame(width: cardWidth, height: cardHeight)
            .overlay {
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Take a look at your")
                            .foregroundColor(colorPalette.black2)
                            .font(.system(size: 45).weight(.semibold))
                        
                        HStack(spacing: 0) {
                            ColorRectangle(color: .red)
                            
                            ColorRectangle(color: .orange)
                            
                            ColorRectangle(color: .yellow)
                            
                            ColorRectangle(color: .green)
                            
                            ColorRectangle(color: .blue)
                            
                            ColorRectangle(color: .purple)
                        }
                        .rotationEffect(.degrees(-30))
                        .frame(width: 430, height: 100)
                        .mask(
                            Text("favorite")
                                .font(.system(size: 128).weight(.semibold))
                        )
                        
                        Text("outfits & items.")
                            .foregroundColor(colorPalette.black2)
                            .font(.system(size: 45).weight(.semibold))
                        
                        NavigationLink {
                            // link to another view goes here...
                        } label: {
                            HStack(alignment: .bottom) {
                                Text("See all your favorite outfits & items")
                                
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
                
                Image("FCIcon1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 456)
                    .rotationEffect(.degrees(icon1RotationValue))
                    .overlay {
                        Image("FCIcon2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 191)
                            .shadow(color: .black.opacity(0.15), radius: 5, x: -6, y: 6)
                            .rotationEffect(.degrees(icon2RotationValue))
                    }
                    .offset(y: 145)
            }
            .onAppear {
                let baseAnimation = Animation.linear(duration: 30)
                let repeated = baseAnimation.repeatForever(autoreverses: false)
                withAnimation(repeated) {
                    icon1RotationValue = 360
                    icon2RotationValue = -360
                }
            }
    }
}

// MARK: PREVIEWS
struct FavouritesCardView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesCardView()
            .environmentObject(ColorPalette())
            .previewInterfaceOrientation(.portrait)
    }
}

// MARK: SUBVIEWS

// MARK: ColorRectangle
struct ColorRectangle: View {
    let color: Color
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(width: 68, height: 500)
    }
}

