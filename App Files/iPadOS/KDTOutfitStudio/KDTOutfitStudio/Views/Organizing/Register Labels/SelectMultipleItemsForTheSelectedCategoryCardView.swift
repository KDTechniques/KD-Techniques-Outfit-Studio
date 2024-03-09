//
//  SelectMultipleItemsForTheSelectedCategoryCardView.swift
//  KDTOutfitStudio
//
//  Created by Mr. Kavinda Dilshan on 2022-07-12.
//

import SwiftUI

struct SelectMultipleItemsForTheSelectedCategoryCardView: View {
    
    // MARK: PROPERTIES
    @EnvironmentObject var organizingVM: OrganizingViewModel
    @EnvironmentObject var colorPelette: ColorPalette
    
    // MARK: BODY
    var body: some View {
        Rectangle()
            .fill(colorPelette.grey3)
            .frame(width: 523, height: 750)
            .overlay {
                VStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Select multiple items for the selected category")
                            .font(.system(size: 27.67).weight(.semibold))
                        
                        Text("Below are uncategorized items in the outfits library")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                            .padding(.top)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                    
                    ScrollView {
                        LazyVGrid(columns: organizingVM.columns2, spacing: 40) {
                            ForEach(organizingVM.uncategorisedItemsArray, id: \.self) { item in
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(item.isSelected ? colorPelette.orange2 : .clear, lineWidth: 2)
                                    .frame(width: 145, height: 145)
                                    .padding(.vertical)
                                    .overlay {
                                        Image(item.label)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 132)
                                    }
                                    .onTapGesture {
                                        organizingVM.tapGestureOnuncategorisedItems(item: item)
                                    }
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 7)
                    .padding(.bottom, 30)
                }
                .padding(.top, 35)
            }
            .cornerRadius(27)
            .shadow(color: .black.opacity(0.07), radius: 12, x: 0, y: 0)
            .onChange(of: organizingVM.selectedCategory) { newValue in
                organizingVM.resetSelectedItems()
            }
    }
}

// MARK: PREVIEWS
struct SelectMultipleItemsForTheSelectedCategoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        SelectMultipleItemsForTheSelectedCategoryCardView()
            .environmentObject(ColorPalette())
            .environmentObject(OrganizingViewModel())
    }
}
