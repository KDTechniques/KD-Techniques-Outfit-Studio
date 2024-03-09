//
//  WelcomeScreen.swift
//  KDTOutfitStudio
//
//  Created by Mr. Kavinda Dilshan on 2022-07-08.
//

import SwiftUI

struct LockScreenView: View {
    
    // MARK: PROPERTIES
    @State private var isLockScreenOn: Bool = false // make it true later
    
    let screenWidth: CGFloat = UIScreen.main.bounds.size.width
    
    // MARK: BODY
    var body: some View {
        if isLockScreenOn {
            Rectangle()
                .fill(.black)
                .ignoresSafeArea(.all)
                .overlay {
                    Image("LockScreenLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: screenWidth/2)
                }
                .onTapGesture(count: 2) {
                    isLockScreenOn.toggle()
                }
        } else { HomeScreenView(isLockScreenOn: $isLockScreenOn) }
    }
}

// MARK: PREVIEWS
struct LockScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LockScreenView()
            .environmentObject(UnwornItemsViewModel())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
