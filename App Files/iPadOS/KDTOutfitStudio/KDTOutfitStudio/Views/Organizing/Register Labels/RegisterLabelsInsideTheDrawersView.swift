//
//  RegisterLabelsInsideTheDrawersView.swift
//  KDTOutfitStudio
//
//  Created by Mr. Kavinda Dilshan on 2022-07-13.
//

import SwiftUI

struct RegisterLabelsInsideTheDrawersView: View {
    
    // MARK: PROPERTIES
    @EnvironmentObject var organizingVM: OrganizingViewModel
    @EnvironmentObject var colorPelette: ColorPalette
    
    // MARK: BODY
    var body: some View {
        ZStack {
            KDTOutfitStudioLogoView()
            
            VStack {
                Rectangle()
                    .fill(colorPelette.blue2)
                    .frame(maxWidth: .infinity)
                    .frame(height: 414)
                    .overlay {
                        HStack {
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: 0) {
                                Text("Register labels\ninside the drawers")
                                    .font(.system(size: 46.87).weight(.semibold))
                                
                                Text("Now you can put the selected items according to the given labels\ninside the respected drawers and register labels for better\norganizing and easy planning in the future.")
                                    .font(.system(size: 12.13))
                                    .lineSpacing(1.7)
                                    .padding(.top)
                                
                                Spacer()
                                
                                HStack {
                                    Spacer()
                                    
                                    VStack(spacing: 8) {
                                        Button {
                                            // action goes here...
                                            withAnimation(.linear(duration: 5)) {
                                                organizingVM.shallOpen.toggle()
                                            }
                                        } label: {
                                            Image("OpenCloseIcon")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 76)
                                                .padding(.vertical, 12)
                                                .padding(.horizontal, 22)
                                                .background(.blue)
                                                .cornerRadius(.infinity)
                                                .foregroundColor(.white)
                                        }
                                        
                                        Text("Open/Close Drawers")
                                            .font(.system(size: 8))
                                            .foregroundColor(colorPelette.grey2)
                                    }
                                }
                            }
                            .foregroundColor(colorPelette.black2)
                            .frame(width: 384)
                            .padding(.vertical, 40)
                            
                            Spacer()
                            
                            WardrobeMiddleLayerControllerView(
                                middleLayer: organizingVM.middleLayerArray,
                                shallOpen: organizingVM.shallOpen
                            )
                            
                            Spacer()
                        }
                    }
                
                RoundedRectangle(cornerRadius: 33.44)
                    .stroke(colorPelette.pink1, lineWidth: 9)
                    .frame(height: 252)
                    .overlay(
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 50) {
                                ForEach(organizingVM.selectedItemsArray, id: \.self) { item in
                                    LabeledItemView(label: item.label, labelID: item.labelID)
                                }
                            }
                            .padding(.horizontal, 50)
                        }
                            .padding(.horizontal, 9/2)
                    )
                    .padding(.horizontal, 47)
                    .padding(.vertical)
                
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("How to register labels?")
                            .font(.system(size: 14.44))
                            .foregroundColor(colorPelette.black2)
                        
                        Text("Now you may pick up the items and put them inside the\nrespected drawers according to the given label IDs.")
                            .font(.system(size: 8.52))
                            .padding(.top, 16)
                            .foregroundColor(colorPelette.black1)
                        
                        Text("After that, you may tap on the button next to the relevant\nlabel IDto complete the registration for a particular item.")
                            .font(.system(size: 8.52))
                            .padding(.top, 10)
                            .foregroundColor(colorPelette.black1)
                    }
                    .padding(.trailing, 25)
                    
                    HStack(spacing: 20) {
                        BeforeAfterRegistrationPreviewCardView(
                            text: "Before registration",
                            color: colorPelette.grey5
                        )
                        
                        Rectangle()
                            .fill(colorPelette.grey1)
                            .frame(width: 1, height: 86)
                            .offset(y: -9)
                        
                        BeforeAfterRegistrationPreviewCardView(
                            text: "After registration",
                            color: colorPelette.green1
                        )
                    }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 47)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.top, 80)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Text("Done")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 22)
                    .background(.blue)
                    .cornerRadius(.infinity)
                    .foregroundColor(.white)
                    .opacity(0)
            }
        }
        .onAppear {
            organizingVM.getMiddleLayersFromSelectedItems()
        }
        .onDisappear {
            organizingVM.selectedItemsArray.removeAll()
            organizingVM.shallOpen = false
            organizingVM.middleLayerArray.removeAll()
        }
    }
}

// MARK: PREVIEWS
struct RegisterLabelsInsideTheDrawersView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterLabelsInsideTheDrawersView()
            .topLeadingNavigationButtonForPreviews(label: "Organizing - Register Labels")
            .previewInterfaceOrientation(.landscapeLeft)
            .environmentObject(ColorPalette())
            .environmentObject(OrganizingViewModel())
    }
}
