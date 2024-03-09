//
//  OrganizingRootView.swift
//  KDTOutfitStudio
//
//  Created by Mr. Kavinda Dilshan on 2022-07-11.
//

import SwiftUI

struct OrganizingRootView: View {
    
    // MARK: PROPERTIES
    @EnvironmentObject var colorPalette: ColorPalette
    
    // MARK: BODY
    var body: some View {
        ZStack {
            KDTOutfitStudioLogoView()
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Organizing")
                    .font(.system(size: 25).weight(.medium))
                    .foregroundColor(colorPalette.grey2)
                
                Text("Select items from outfits library.\nCategorize em'.\nRegister labels.")
                    .font(.system(size: 57.66).weight(.semibold))
                    .foregroundColor(colorPalette.black2)
                    .padding(.top, 10)
                
                NavigationLink {
                    OrganizingRootView2()
                } label: {
                    Text("Get started")
                        .padding(.vertical, 12)
                        .padding(.horizontal, 22)
                        .background(.blue)
                        .cornerRadius(.infinity)
                        .foregroundColor(.white)
                        .padding(.top, 40)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.leading, 300)
            .padding(.top, 100)
            
            Image("Shoe2")
                .resizable()
                .scaledToFit()
                .frame(width: 405)
                .offset(x: 300, y: 100)
                .overlay(alignment: .bottom) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Nike Joyride CC3 Setter")
                                .font(.system(size: 10.69))
                                .foregroundColor(colorPalette.grey2)
                            
                            Text("Sneaker")
                                .font(.system(size: 7.78))
                                .foregroundColor(colorPalette.black1)
                        }
                        .offset(x: -10, y: 53)
                        
                        Image("SIcon1")
                    }
                    .offset(x: -80, y: 80)
                }
        }
        .navigationBarTitle("Organizing", displayMode: .inline)
    }
}

// MARK: PREVIEWS
struct OrganizingRootView_Previews: PreviewProvider {
    static var previews: some View {
        OrganizingRootView()
            .topLeadingNavigationButtonForPreviews(label: "Home")
            .previewInterfaceOrientation(.landscapeLeft)
            .environmentObject(ColorPalette())
    }
}
