//
//  WardrobeView.swift
//  KDTOutfitStudio
//
//  Created by Mr. Kavinda Dilshan on 2022-07-13.
//

import SwiftUI

struct WardrobeMiddleLayerControllerView: View {
    
    // MARK: PROPERTIES
    @EnvironmentObject var organizingVM: OrganizingViewModel
    
    let middleLayer: [WardrobeMiddleLayerTypes]
    let shallOpen: Bool
    
    // MARK: BODY
    var body: some View {
        ZStack {
            Image("BottomLayer")
                .resizable()
                .scaledToFit()
            
            ForEach(WardrobeMiddleLayerTypes.allCases, id: \.self) { item in
                Image(item.rawValue)
                    .resizable()
                    .scaledToFit()
                    .offset(x: middleLayer.contains(where: { $0 == item })
                            ? shallOpen
                            ? organizingVM.openToLeftDrawers.contains(where: { $0 == item })
                            ? -71.3625
                            : 71.3625
                            : 0
                            : 0
                    )
            }
        }
        .frame(width: 857)
    }
}

// MARK: PREVIEWS
struct WardrobeMiddleLayerControllerView_Previews: PreviewProvider {
    static var previews: some View {
        WardrobeMiddleLayerControllerView(
            middleLayer: [.tanktops, .trousers],
            shallOpen: true
        )
        .previewInterfaceOrientation(.landscapeLeft)
        .environmentObject(OrganizingViewModel())
    }
}
