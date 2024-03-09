//
//  TopTrailingNavigationButtonView.swift
//  KDTOutfitStudio
//
//  Created by Mr. Kavinda Dilshan on 2022-07-13.
//

import SwiftUI

struct TopTrailingNavigationButtonView: View {
    
    // MARK: PROPERTIES
    let label: String
    
    // MARK: BODY
    var body: some View {
        HStack(spacing: 5) {
            Text(label)
                .fontWeight(.semibold)
            
            Image(systemName: "chevron.right")
                .font(.body.weight(.semibold))
        }
        .foregroundColor(.accentColor)
    }
}

// MARK: PREVIEWS
struct TopTrailingNavigationButton_Previews: PreviewProvider {
    static var previews: some View {
        TopTrailingNavigationButtonView(label: "Next")
    }
}
