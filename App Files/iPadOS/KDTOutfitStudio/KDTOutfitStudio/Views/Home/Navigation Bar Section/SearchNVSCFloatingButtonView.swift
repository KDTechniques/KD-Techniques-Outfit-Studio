//
//  Search&VSCFloatingButtonView.swift
//  KDTOutfitStudio
//
//  Created by Mr. Kavinda Dilshan on 2022-07-08.
//

import SwiftUI

struct SearchNVSCFloatingButtonView: View {
    
    // MARTK: PROPERIES
    @State private var isFold: Bool = true
    
    // MARK: BODY
    var body: some View {
        ZStack {
            UtilityButtonsList(isFold: $isFold)
                .frame(height: 290, alignment: .top)
            
            FoldUnfoldButton(isFold: $isFold)
                .offset(y: -185)
        }
        .onDisappear {
            isFold = true
        }
    }
}

// MARK: PREVIEWS
struct SearchNVSCFloatingButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SearchNVSCFloatingButtonView()
            .previewInterfaceOrientation(.portrait)
    }
}

// MARK: SUBVIEWS

// MARK: HorizontalRectangle
struct HorizontalRectangle: View {
    var body: some View {
        Rectangle()
            .fill(Color(uiColor: .systemGray4))
            .frame(width: 35, height: 1)
    }
}


// MARK: UtilityIcon
struct UtilityIcon: View {
    let imageName: String?
    let simageName: String?
    let height: CGFloat
    let label: String
    let action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                if let imageName = imageName {
                    Image(imageName)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color(uiColor: .systemGray2))
                        .frame(height: height)
                } else {
                    if let simageName = simageName {
                        Image(systemName: simageName)
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color(uiColor: .systemGray2))
                            .frame(height: height)
                    }
                }
                
                Text(label)
                    .font(.system(size: 8).weight(.medium))
                    .foregroundColor(Color(uiColor: .systemGray3))
            }
        }
    }
}


// MARK: UtilityButtonsList
struct UtilityButtonsList: View {
    @Binding var isFold: Bool
    var body: some View {
        VStack(spacing: 16) {
            UtilityIcon(imageName: "MagnifyingGlass", simageName: nil, height: 20, label: "Search") { }
            
            HorizontalRectangle()
            
            UtilityIcon(imageName: nil, simageName: "star", height: 20, label: "Favorites") { }
            
            HorizontalRectangle()
            
            UtilityIcon(imageName: "SuitCase", simageName: nil, height: 28, label: "V Suitcase") { }
            
            HorizontalRectangle()
            
            UtilityIcon(imageName: nil, simageName: "questionmark.circle", height: 20, label: "Support") { }
        }
        .frame(width: 60, height: isFold ? 0 : 290)
        .background(.white)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.1), radius: 5)
    }
}


// MARK: FoldUnfoldButton
struct FoldUnfoldButton: View {
    @Binding var isFold: Bool
    var body: some View {
        Button {
            withAnimation(.default) {
                isFold.toggle()
            }
        } label: {
            Image(systemName: "arrow.up.arrow.down")
                .frame(width: 60, height: 50)
                .background(.white)
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.1), radius: 5)
                .foregroundColor(Color(uiColor: .systemGray2))
        }
    }
}
