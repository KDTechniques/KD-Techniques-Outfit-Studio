//
//  UnwornItemsViewModel.swift
//  KDTOutfitStudio
//
//  Created by Mr. Kavinda Dilshan on 2022-07-09.
//

import Foundation
import SwiftUI

class UnwornItemsViewModel: ObservableObject {
    
    // MARK: PROPERTIES
    
    // singleton
    static let shared = UnwornItemsViewModel()
    
    // an id that doesn't exist anywhere
    let noneID: String = UUID().uuidString
    
    // controls the current id of the unworn items slider
    @Published var currentID: String = ""
    
    // temporary sample items as unworn items
    /// remove this after implementing firebase to the project
    @Published var unwornItemsArray: [UnwornItemModel] = [
        UnwornItemModel(
            imageName: "Tshirt1",
            itemName: "Legend Practice Performance Brooklyn Nets Nike Heathered Charcoal",
            categoryName: .tshirts
        ),
        UnwornItemModel(
            imageName: "Shoe1",
            itemName: "Nike White/Red KD 13",
            categoryName: .sneakers
        ),
        UnwornItemModel(
            imageName: "Short1",
            itemName: "New York Knicks Nike Blue Icon Swingman",
            categoryName: .shorts
        ),
        UnwornItemModel(
            imageName: "Watch1",
            itemName: "Apple Watch Series 7 41mm Blue Aluminum Case",
            categoryName: .watches
        ),
        UnwornItemModel(
            imageName: "WatchStrap1",
            itemName: "Pride Edition Braided Solo Loop",
            categoryName: .watchstraps
        )
    ]
    
    
    
    
    
    // MARK: FUNCTIONS
    
    
    // MARK: getIndex
    /// this function helps to get the index number in the array related to the given unworn item id
    /// this will use to properly navigate unworn items in the slider list
    func getIndex(byID: String) -> Int {
        var index: Int = -1
        
        if let _index = unwornItemsArray.firstIndex(where: { $0.id == byID }) {
            index = _index
        }
        
        return index
    }
    
    
    // MARK: getID
    /// this function will gives the id in the unworn items array when provide an index
    /// mostly helps to reduce single line code by this function
    func getID(byIndex: Int) -> String {
        return unwornItemsArray[byIndex].id
    }
    
    
    // MARK: navigateToLeftItem
    /// this function will navigate the current selected unworn item to the previous item
    func navigateToLeftItem() {
        if currentID != getID(byIndex: 0) {
            withAnimation(.spring()) {
                let currentItemIDIndex = getIndex(byID: currentID)
                currentID = getID(byIndex: currentItemIDIndex-1)
            }
        }
    }
    
    
    // MARK: navigateToRightItem
    /// this function will navigate the current selected unworn item to the next item
    func navigateToRightItem() {
        if currentID != getID(byIndex: unwornItemsArray.count-1) {
            withAnimation(.spring()) {
                let currentItemIDIndex = getIndex(byID: currentID)
                currentID = getID(byIndex: currentItemIDIndex+1)
            }
        }
    }
    
    
    // MARK: onAppear
    /// this method will decide what to select as the current item when the unworn slider appears
    func onAppear() {
        // if the list has only one item, the current index must be 0.
        if unwornItemsArray.count == 1 {
            currentID = getID(byIndex: 0)
        } else {
            currentID = getID(byIndex: 1)
        }
    }
}
