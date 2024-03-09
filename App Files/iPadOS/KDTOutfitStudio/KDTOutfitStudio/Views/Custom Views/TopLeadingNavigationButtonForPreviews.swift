//
//  TopLeadingNavigationButtonForPreviews.swift
//  KDTOutfitStudio
//
//  Created by Mr. Kavinda Dilshan on 2022-07-12.
//

import Foundation
import SwiftUI

struct TopLeadingNavigationButtonForPreviews: ViewModifier {
    let label: String
    func body(content: Content) -> some View {
        NavigationView {
            content
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        HStack(spacing: 5) {
                            Image(systemName: "chevron.left")
                                .font(.body.weight(.semibold))
                            Text(label)
                        }
                        .foregroundColor(.accentColor)
                    }
                }
        }
        .navigationViewStyle(.stack)
    }
}

extension View {
    func topLeadingNavigationButtonForPreviews(label: String) -> some View {
        modifier(TopLeadingNavigationButtonForPreviews(label: label))
    }
}
