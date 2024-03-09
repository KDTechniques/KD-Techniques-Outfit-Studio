//
//  OrganizingRootView2.swift
//  KDTOutfitStudio
//
//  Created by Mr. Kavinda Dilshan on 2022-07-11.
//

import SwiftUI

struct OrganizingRootView2: View {
    
    // MARK: PROPERTIES
    @EnvironmentObject var colorPalette: ColorPalette
    
    // MARK: BODY
    var body: some View {
        ZStack {
            KDTOutfitStudioLogoView()
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Organizing")
                    .font(.system(size: 25).weight(.medium))
                    .foregroundColor(.clear)
                
                Text("Choose an option\nto continue")
                    .font(.system(size: 57.66).weight(.semibold))
                    .foregroundColor(colorPalette.black2)
                    .padding(.top, 10)
                
                NavigationLink {
                    Organizing_RegisterLabelsView()
                } label: {
                    Text("Register labels")
                        .padding(.vertical, 12)
                        .padding(.horizontal, 22)
                        .background(.blue)
                        .cornerRadius(.infinity)
                        .foregroundColor(.white)
                        .padding(.top, 40)
                }
                
                NavigationLink {
                    
                } label: {
                    Text("Rearrange items in the drawers")
                        .padding(.vertical, 12)
                        .padding(.horizontal, 22)
                        .background(.blue)
                        .cornerRadius(.infinity)
                        .foregroundColor(.white)
                        .padding(.top, 30)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.leading, 300)
            .padding(.top, 100)
            
            Image("Icon3")
                .resizable()
                .scaledToFit()
                .frame(width: 1366)
                .offset(x: 245, y: 80)
        }
        .navigationBarTitle("Organizing - What would you like to do?", displayMode: .inline)
    }
}

// MARK: PREVIEWS
struct OrganizingRootView2_Previews: PreviewProvider {
    static var previews: some View {
        OrganizingRootView2()
            .topLeadingNavigationButtonForPreviews(label: "Organizing")
            .previewInterfaceOrientation(.landscapeLeft)
            .environmentObject(ColorPalette())
    }
}
