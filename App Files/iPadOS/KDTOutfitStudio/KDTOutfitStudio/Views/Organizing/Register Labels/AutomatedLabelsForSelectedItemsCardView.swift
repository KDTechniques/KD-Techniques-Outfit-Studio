//
//  AutomatedLabelsForSelectedItemsCardView.swift
//  KDTOutfitStudio
//
//  Created by Mr. Kavinda Dilshan on 2022-07-12.
//

import SwiftUI

struct AutomatedLabelsForSelectedItemsCardView: View {
    
    // MARK: PROPERTIES
    @EnvironmentObject var organizingVM: OrganizingViewModel
    @EnvironmentObject var colorPelette: ColorPalette
    
    
    // MARK: BODY
    var body: some View {
        Rectangle()
            .fill(colorPelette.grey3)
            .frame(width: 372, height: 750)
            .overlay {
                VStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Drawer label IDs for the selected items")
                            .font(.system(size: 27.67).weight(.semibold))
                        
                        Text("The system can't generate a label for some items.")
                            .font(.footnote.weight(.semibold))
                            .foregroundColor(colorPelette.Red1)
                            .padding(.top)
                            .opacity(organizingVM.outOfSlotsWarningTextOpac)
                            .opacity(organizingVM.selectedItemsArray.contains(where: { $0.labelID == "out of slots" }) ? 1 : 0)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                    .onAppear {
                        let baseAnimation = Animation.spring()
                        let repeated = baseAnimation.repeatForever(autoreverses: true)
                        withAnimation(repeated) {
                            organizingVM.outOfSlotsWarningTextOpac = 1
                        }
                    }
                    
                    ScrollView {
                        VStack(spacing: 40) {
                            ForEach(organizingVM.selectedItemsArray, id: \.self) { item in
                                HStack(spacing: 20) {
                                    Rectangle()
                                        .fill(.clear)
                                        .frame(width: 150, height: 132)
                                        .overlay {
                                            Image(item.label)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 132)
                                        }
                                    
                                    ZStack {
                                        if item.labelID != "out of slots" {
                                            Text(item.labelID)
                                                .frame(width: 107, height: 30)
                                                .background(colorPelette.orange2)
                                        } else {
                                            Text(item.labelID)
                                                .frame(width: 107, height: 30)
                                                .background(colorPelette.Red1)
                                        }
                                    }
                                    .font(.caption2)
                                    .foregroundColor(.white)
                                    .cornerRadius(.infinity)
                                    
                                }
                                .frame(height: 145)
                                .padding(.vertical)
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 7)
                    .padding(.bottom, 30)
                }
                .padding(.top, 35)
            }
            .cornerRadius(27)
            .shadow(color: .black.opacity(0.07), radius: 12, x: 0, y: 0)
            .onAppear {
                organizingVM.selectedItemsArray.removeAll()
            }
    }
}

// MARK: PREVIEWS
struct AutomatedLabelsForSelectedItemsCardView_Previews: PreviewProvider {
    static var previews: some View {
        AutomatedLabelsForSelectedItemsCardView()
            .environmentObject(ColorPalette())
            .environmentObject(OrganizingViewModel())
            .previewInterfaceOrientation(.portrait)
    }
}
