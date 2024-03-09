//
//  UnwornItemsNavigatorButtonView.swift
//  KDTOutfitStudio
//
//  Created by Mr. Kavinda Dilshan on 2022-07-08.
//

import SwiftUI

struct UnwornItemsNavigatorButtonView: View {
    
    // MARK: PROPERTIES
    let isOpac: Bool
    let action: () -> Void
    let orientation: OrientationTypes
    
    // MARK: BODY
    var body: some View {
        Button {
            action()
        } label: {
            Circle()
                .fill(Color(uiColor: isOpac ? .systemGray5 : .systemGray2))
                .frame(width: 60)
                .overlay {
                    Image("Chevron")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 12)
                        .rotationEffect(.degrees(orientation == .left ? 0 : 180))
                        .offset(x: orientation == .left ? -2 : 2)
                }
        }
        .disabled(isOpac ? true : false)
    }
}

// MARK: PREVIEWS
struct UnwornItemsNavigatorButtonView_Previews: PreviewProvider {
    static var previews: some View {
        UnwornItemsNavigatorButtonView(
            isOpac: false,
            action: { },
            orientation: .left
        )
        .previewInterfaceOrientation(.landscapeLeft)
    }
}
