//
//  Organizing_RegisterLabelsView.swift
//  KDTOutfitStudio
//
//  Created by Mr. Kavinda Dilshan on 2022-07-12.
//

import SwiftUI

struct Organizing_RegisterLabelsView: View {
    
    // MARK: PROPERTIES
    @EnvironmentObject var organizingVM: OrganizingViewModel
    @EnvironmentObject var colorPalette: ColorPalette
    
    // MARK: BODY
    var body: some View {
        ZStack {
            KDTOutfitStudioLogoView()
            
            HStack(spacing: -15) {
                Spacer()
                
                PickASuitableCategoryForOrganizingCardView()
                
                Spacer()
                
                SelectMultipleItemsForTheSelectedCategoryCardView()
                
                Spacer()
                
                AutomatedLabelsForSelectedItemsCardView()
                
                Spacer()
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(
                    destination: RegisterLabelsInsideTheDrawersView(),
                    isActive: $organizingVM.isOutOfSlotsAlertAccepted,
                    label: {
                        Button {
                            organizingVM.outOfDrawerSlotsAlertGenerator()
                        } label: {
                            TopTrailingNavigationButtonView(label: "Next")
                        }
                    })
                .opacity(organizingVM.selectedItemsArray.isEmpty ? 0 : 1)
                .disabled(organizingVM.selectedItemsArray.isEmpty)
            }
        }
        .navigationTitle("Organizing - Register Labels")
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear {
            organizingVM.resetSelectedItems()
        }
        .alert(item: $organizingVM.alertItemForOrganizing) { alert -> Alert in
            Alert(
                title: Text(alert.title),
                message: Text(alert.message),
                primaryButton: alert.primaryButton ?? .cancel(),
                secondaryButton: alert.dismissButton ?? .cancel()
            )
        }
    }
}

// MARK: PREVIEWS
struct Organizing_RegisterLabelsView_Previews: PreviewProvider {
    static var previews: some View {
        Organizing_RegisterLabelsView()
            .topLeadingNavigationButtonForPreviews(label: "Organizing - What would you like to do?")
            .environmentObject(ColorPalette())
            .environmentObject(OrganizingViewModel())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
