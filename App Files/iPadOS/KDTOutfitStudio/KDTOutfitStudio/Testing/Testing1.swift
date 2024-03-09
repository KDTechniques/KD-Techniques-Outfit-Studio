//
//  Testing1.swift
//  KDTOutfitStudio
//
//  Created by Mr. Kavinda Dilshan on 2022-07-14.
//

import SwiftUI

struct Testing1: View {
    
    @EnvironmentObject var organizingVM: OrganizingViewModel
    
    let label: String = "SN 10"
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                ForEach(organizingVM.drawersSlotsArray, id: \.self) { item in
                    HStack {
                        Text(item.middleLayer.rawValue)
                        Text(item.slotsArray.description)
                    }
                }
            }
            .padding(.leading)
        }
        .onAppear {
            organizingVM.drawerSlotsDefiner()
        }
    }
}

struct Testing1_Previews: PreviewProvider {
    static var previews: some View {
        Testing1()
            .previewInterfaceOrientation(.portrait)
            .environmentObject(OrganizingViewModel())
    }
}
