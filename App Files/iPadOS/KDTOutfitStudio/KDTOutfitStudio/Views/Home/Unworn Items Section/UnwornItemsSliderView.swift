//
//  UnwornItemsSliderView.swift
//  KDTOutfitStudio
//
//  Created by Mr. Kavinda Dilshan on 2022-07-08.
//

import SwiftUI

struct UnwornItemsSliderView: View {
    
    // MARK: PROPERTIES
    @EnvironmentObject var unwornItemsVM: UnwornItemsViewModel
    
    // MARK: BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { scrollViewProxy in
                HStack(spacing: -20) {
                    ForEach(unwornItemsVM.unwornItemsArray) { item in
                        UnwornItemCardView(
                            scaleType: unwornItemsVM.currentID == item.id ? .scaleUp : .scaleDown,
                            item: item
                        )
                        .id(item.id)
                        .gesture(
                            DragGesture()
                                .onChanged { _ in
                                    withAnimation(.spring()) {
                                        unwornItemsVM.currentID = unwornItemsVM.noneID
                                    }
                                }
                        )
                        .onTapGesture {
                            withAnimation(.spring()) {
                                unwornItemsVM.currentID = item.id
                            }
                        }
                    }
                    .frame(height: 580)
                }
                .onChange(of: unwornItemsVM.currentID) { newValue in
                    withAnimation {
                        scrollViewProxy.scrollTo(newValue, anchor: .center)
                    }
                }
            }
        }
        .padding(.horizontal, 130)
        .gesture(
            DragGesture()
                .onChanged { _ in
                    withAnimation(.spring()) {
                        unwornItemsVM.currentID = unwornItemsVM.noneID
                    }
                }
        )
        .overlay {
            HStack {
                UnwornItemsNavigatorButtonView(
                    isOpac: unwornItemsVM.currentID == unwornItemsVM.getID(byIndex: 0) ? true : false,
                    action: {
                        // navigate to left action goes here...
                        unwornItemsVM.navigateToLeftItem()
                    },
                    orientation: .left
                )
                
                Spacer()
                
                UnwornItemsNavigatorButtonView(
                    isOpac: unwornItemsVM.currentID == unwornItemsVM.getID(byIndex: unwornItemsVM.unwornItemsArray.count-1) ? true : false,
                    action: {
                        // navigate to right action goes here...
                        unwornItemsVM.navigateToRightItem()
                    },
                    orientation: .right
                )
            }
            .padding(.horizontal, 30)
            .opacity(unwornItemsVM.currentID == unwornItemsVM.noneID ? 0 : 1)
            .disabled(unwornItemsVM.currentID == unwornItemsVM.noneID ? true : false)
        }
        .onAppear {
            unwornItemsVM.onAppear()
        }
    }
}

// MARK: PREVIEWS
struct UnwornItemsSliderView_Previews: PreviewProvider {
    static var previews: some View {
        UnwornItemsSliderView()
            .environmentObject(UnwornItemsViewModel())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
