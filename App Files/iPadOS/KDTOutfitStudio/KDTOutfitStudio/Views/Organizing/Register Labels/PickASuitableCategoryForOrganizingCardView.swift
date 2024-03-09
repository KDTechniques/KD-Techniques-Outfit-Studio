//
//  PickASuitableCategoryForOrganizingCardView.swift
//  KDTOutfitStudio
//
//  Created by Mr. Kavinda Dilshan on 2022-07-12.
//

import SwiftUI

struct PickASuitableCategoryForOrganizingCardView: View {
    
    // MARK: PROPERTIES
    @EnvironmentObject var organizingVM: OrganizingViewModel
    @EnvironmentObject var colorPalette: ColorPalette
    
    // MARK: BODY
    var body: some View {
        Rectangle()
            .fill(colorPalette.grey3)
            .frame(width: 372, height: 750)
            .overlay {
                VStack {
                    Text("Pick one category to start organizing")
                        .font(.system(size: 27.67).weight(.semibold))
                        .padding(.top, 35)
                        .padding(.leading, 30)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    LazyVGrid(columns: organizingVM.columns1, spacing: 25.5) {
                        ForEach(SubCategoryTypes.allCases.sorted { $0.rawValue < $1.rawValue }, id: \.self) { item in
                            CategoryButton(
                                selectedCategory: $organizingVM.selectedCategory,
                                label: item.rawValue
                            )
                        }
                    }
                    .padding(.top)
                    .padding(.horizontal, 20)
                }
                .frame(maxHeight: .infinity, alignment: .top)
            }
            .cornerRadius(27)
            .shadow(color: .black.opacity(0.07), radius: 12, x: 0, y: 0)
            .onDisappear {
                organizingVM.selectedCategory = ""
            }
    }
}

// MARK: PREVIEWS
struct PickASuitableCategoryForOrganizingCardView_Previews: PreviewProvider {
    static var previews: some View {
        PickASuitableCategoryForOrganizingCardView()
            .environmentObject(ColorPalette())
            .environmentObject(OrganizingViewModel())
            .previewInterfaceOrientation(.portrait)
    }
}

// MARK: SUBVIEWS


// MARK: CategoryButton
struct CategoryButton: View {
    @EnvironmentObject var organizingVM: OrganizingViewModel
    @EnvironmentObject var colorPalette: ColorPalette
    @Binding var selectedCategory: SubCategoryTypes.RawValue
    let label: String
    var body: some View {
        Text(label)
            .font(.caption2.weight(.medium))
            .foregroundColor(.white)
            .frame(width: 107, height: 30)
            .background(selectedCategory == label ? colorPalette.orange2 : colorPalette.grey4)
            .cornerRadius(10)
            .onTapGesture {
                organizingVM.selectedItemsArray.removeAll()
                if selectedCategory == label {
                    selectedCategory = ""
                } else {
                    selectedCategory = label
                }
            }
    }
}

