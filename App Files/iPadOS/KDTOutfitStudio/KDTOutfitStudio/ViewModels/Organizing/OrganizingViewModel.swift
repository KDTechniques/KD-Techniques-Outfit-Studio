//
//  OrganizingViewModel.swift
//  KDTOutfitStudio
//
//  Created by Mr. Kavinda Dilshan on 2022-07-11.
//

import Foundation
import SwiftUI

class OrganizingViewModel: ObservableObject {
    
    // MARK: PROPERTIES
    
    // singleton
    static let shared = OrganizingViewModel()
    
    // decies colums model for "pick a suitable ategory for organizing" card
    let columns1 = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    // controls the selected category when picking up an item for label registration
    @Published var selectedCategory: SubCategoryTypes.RawValue = ""
    
    // decies colums model for "Select multiple items for the selected category" card
    let columns2 = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    // a temporary array to show uncategorized items in outfit library
    @Published var uncategorisedItemsArray: [UncategorisedItemModel] = [
        UncategorisedItemModel(label: "Shoe6", isSelected: false),
        UncategorisedItemModel(label: "Short1", isSelected: false),
        UncategorisedItemModel(label: "Tshirt3", isSelected: false),
        UncategorisedItemModel(label: "Shoe3", isSelected: false),
        UncategorisedItemModel(label: "Tshirt4", isSelected: false),
        UncategorisedItemModel(label: "Shoe4", isSelected: false),
        UncategorisedItemModel(label: "Tshirt2", isSelected: false),
        UncategorisedItemModel(label: "Shoe5", isSelected: false),
        UncategorisedItemModel(label: "Shoe2", isSelected: false),
        UncategorisedItemModel(label: "Tshirt1", isSelected: false),
    ]
    
    // temporarly store selected items from outfit studio
    @Published var selectedItemsArray = [SelectedItemModel]()
    
    // a temporary representation of reserved label slots in the wardrobe
    @Published var reservedItemLablesArray: [String] = ["SN 05", "SN 03", "SN 06", "TH 03", "TH 05", "TH 02"]
    
    let subCategoryLabelTypesArray: [SubCategoryLabelTypeModel] = [
        SubCategoryLabelTypeModel(shortName: .shirts, longName: .shirts),
        SubCategoryLabelTypeModel(shortName: .tshirts, longName: .tshirts),
        SubCategoryLabelTypeModel(shortName: .vests, longName: .vests),
        SubCategoryLabelTypeModel(shortName: .suits, longName: .suits),
        SubCategoryLabelTypeModel(shortName: .tanktops, longName: .tanktops),
        SubCategoryLabelTypeModel(shortName: .hoodies, longName: .hoodies),
        SubCategoryLabelTypeModel(shortName: .trousers, longName: .trousers),
        SubCategoryLabelTypeModel(shortName: .jeans, longName: .jeans),
        SubCategoryLabelTypeModel(shortName: .shorts, longName: .shorts),
        SubCategoryLabelTypeModel(shortName: .underpants, longName: .underpants),
        SubCategoryLabelTypeModel(shortName: .socks, longName: .socks),
        SubCategoryLabelTypeModel(shortName: .formalshoes, longName: .formalshoes),
        SubCategoryLabelTypeModel(shortName: .sneakers, longName: .sneakers),
        SubCategoryLabelTypeModel(shortName: .flipflops, longName: .flipflops),
        SubCategoryLabelTypeModel(shortName: .neckties, longName: .neckties),
        SubCategoryLabelTypeModel(shortName: .bowties, longName: .bowties),
        SubCategoryLabelTypeModel(shortName: .belts, longName: .belts),
        SubCategoryLabelTypeModel(shortName: .cufflinks, longName: .cufflinks),
        SubCategoryLabelTypeModel(shortName: .watches, longName: .watches),
        SubCategoryLabelTypeModel(shortName: .sunglasses, longName: .sunglasses),
        SubCategoryLabelTypeModel(shortName: .caps, longName: .caps),
        SubCategoryLabelTypeModel(shortName: .watchstraps, longName: .watchstraps),
    ]
    
    // an alert item for the entire organizing section when needed
    @Published var alertItemForOrganizing: AlertItemModel?
    
    // a state whether the user accept to proceed to next view when there's a label ids are out of slots or not
    @Published var isOutOfSlotsAlertAccepted: Bool = false
    
    // an opacity property to control the blinking animation of the out of derawer slots warning text
    @Published var outOfSlotsWarningTextOpac: CGFloat = 0
    
    // a set of drawers that opens to left side
    let openToLeftDrawers: [WardrobeMiddleLayerTypes] = [
        .tshirts1,
        .jeans,
        .watches_straps,
        .sneakers2,
        .shirts1,
        .trousers,
        .formalshoes_belts,
        .sneakers4,
        .suits,
        .jewelries,
        .flipflops,
        .sneakers6
    ]
    
    // controls a purticular drawer open & close mechanism
    @Published var shallOpen: Bool = false
    
    @Published var drawersSlotsArray = [DrawerSlotModel]()
    
    let drawerSlotsDefineArray: [DrawerSlotsDefineModel] = [
        DrawerSlotsDefineModel(slotsCount: 10, middleLayer: .tanktops, shortName: .tanktops),
        DrawerSlotsDefineModel(slotsCount: 10, middleLayer: .tshirts1, shortName: .tshirts),
        DrawerSlotsDefineModel(slotsCount: 10, middleLayer: .tshirts2, shortName: .tshirts),
        DrawerSlotsDefineModel(slotsCount: 10, middleLayer: .shirts1, shortName: .shirts),
        DrawerSlotsDefineModel(slotsCount: 10, middleLayer: .shirts2, shortName: .shirts),
        DrawerSlotsDefineModel(slotsCount: 10, middleLayer: .suits, shortName: .suits),
        DrawerSlotsDefineModel(slotsCount: 10, middleLayer: .underpants, shortName: .underpants),
        DrawerSlotsDefineModel(slotsCount: 10, middleLayer: .jeans, shortName: .jeans),
        DrawerSlotsDefineModel(slotsCount: 10, middleLayer: .shorts, shortName: .shorts),
        DrawerSlotsDefineModel(slotsCount: 10, middleLayer: .trousers, shortName: .trousers),
        DrawerSlotsDefineModel(slotsCount: 10, middleLayer: .hoodies, shortName: .hoodies),
        DrawerSlotsDefineModel(slotsCount: 10, middleLayer: .jewelries, shortName: .sunglasses),
        DrawerSlotsDefineModel(slotsCount: 10, middleLayer: .jewelries, shortName: .neckties),
        DrawerSlotsDefineModel(slotsCount: 10, middleLayer: .jewelries, shortName: .bowties),
        DrawerSlotsDefineModel(slotsCount: 10, middleLayer: .jewelries, shortName: .cufflinks),
        DrawerSlotsDefineModel(slotsCount: 10, middleLayer: .vests, shortName: .vests),
        DrawerSlotsDefineModel(slotsCount: 10, middleLayer: .watches_straps, shortName: .watches),
        DrawerSlotsDefineModel(slotsCount: 20, middleLayer: .watches_straps, shortName: .watchstraps),
        DrawerSlotsDefineModel(slotsCount: 10, middleLayer: .caps, shortName: .caps),
        DrawerSlotsDefineModel(slotsCount: 10, middleLayer: .formalshoes_belts, shortName: .formalshoes),
        DrawerSlotsDefineModel(slotsCount: 10, middleLayer: .formalshoes_belts, shortName: .belts),
        DrawerSlotsDefineModel(slotsCount: 10, middleLayer: .socks, shortName: .socks),
        DrawerSlotsDefineModel(slotsCount: 10, middleLayer: .flipflops, shortName: .flipflops),
        DrawerSlotsDefineModel(slotsCount: 10, middleLayer: .sneakers1, shortName: .sneakers),
        DrawerSlotsDefineModel(slotsCount: 10, middleLayer: .sneakers2, shortName: .sneakers),
        DrawerSlotsDefineModel(slotsCount: 10, middleLayer: .sneakers3, shortName: .sneakers),
        DrawerSlotsDefineModel(slotsCount: 10, middleLayer: .sneakers4, shortName: .sneakers),
        DrawerSlotsDefineModel(slotsCount: 10, middleLayer: .sneakers5, shortName: .sneakers),
        DrawerSlotsDefineModel(slotsCount: 10, middleLayer: .sneakers6, shortName: .sneakers),
    ]
    
    @Published var middleLayerArray: [WardrobeMiddleLayerTypes] = []
    
    // MARK: INITIALIZERS
    init() {
        drawerSlotsDefiner()
    }
    
    
    // MARK: FUNCTIONS
    
    
    // MARK: setAllUncategorisedItemsToNoneSelected
    /// this will set all the isSelected property to false
    func resetSelectedItems() {
        for i in 0...uncategorisedItemsArray.count-1 {
            uncategorisedItemsArray[i].isSelected = false
        }
    }
    
    
    // MARK: tapGestureOnuncategorisedItems
    /// this will decide what needs to be happened when clicking on an uncategorized item
    func tapGestureOnuncategorisedItems(item: UncategorisedItemModel) {
        if !selectedCategory.isEmpty {
            if let index: Int = uncategorisedItemsArray.firstIndex(where: { $0.label == item.label }) {
                let isSelected: Bool = uncategorisedItemsArray[index].isSelected
                if isSelected {
                    uncategorisedItemsArray[index].isSelected = false
                    selectedItemsArray.removeAll(where: { $0.label == item.label })
                    
                    let labelID: String = itemLabelGenerator()
                    if let index: Int = selectedItemsArray.firstIndex(where: { $0.labelID == "out of slots" }) {
                        selectedItemsArray[index].labelID = labelID
                    }
                    
                } else {
                    uncategorisedItemsArray[index].isSelected = true
                    let labelID: String = itemLabelGenerator()
                    selectedItemsArray.append(SelectedItemModel(label: item.label, labelID: labelID))
                }
            }
            
            selectedItemsArray = selectedItemsArray.sorted { $0.labelID < $1.labelID }
        }
    }
    
    
    // MARK: itemLabelAssigner
    /// this will generate a new label id for a selected item
    func itemLabelGenerator() -> String {
        var labelID: String = "out of slots"
        
        /// first we need to find out what the short name for the selected category is. ex: if selected category is "Sneakers", the short name is "SN"
        if let index: Int = subCategoryLabelTypesArray.firstIndex(where: { $0.longName.rawValue == selectedCategory }) {
            
            let shortName: String = subCategoryLabelTypesArray[index].shortName.rawValue
            /// now we have the short name for the selected category.
            /// now we need to find a label id starting from "<shortName> <01>" where a slot has not been reserved yet.
            /// let's assume we have at most 10 slots for any category.
            /// then we have to match the above label id pattern starting from the loweset to highest and find the next lowest number that is availble.
            
            let tempArray: [DrawerSlotsDefineModel] = drawerSlotsDefineArray.filter{ $0.shortName.rawValue == shortName }
            var slotsCount: Int = 0
            
            for item in tempArray {
                slotsCount += item.slotsCount
            }
            
            for number in 1...slotsCount {
                /// we take the lowest to highest number and create a temporary label id
                let tempLabelID: String = "\(shortName) \(String(format: "%02d", number))"
                /// now we have a temorary label id called p2
                /// then we must check whether we have a match in the 'reservedItemLablesArray' & 'selectedItemsArray' or not.
                /// if it matches with the above mentioned two arrays, that means that purticular label id exists either temporarly or permanently in the system.
                /// so we need to find the lowest label id which has no match to the above mention arrays.
                if !reservedItemLablesArray.contains(where: { $0 == tempLabelID }) && !selectedItemsArray.contains(where: { $0.labelID == tempLabelID }) {
                    /// this will excecute only when there's no match to the temporary label id in the above two arrays.
                    /// so we can assign the temporary label id to the label id
                    labelID = tempLabelID
                    /// once we assign the temporary label id, we no longer need to itterate through the for loop.
                    /// so we can break the loop and return the assigned label id out of the function.
                    break
                }
            }
        }
        
        return labelID
    }
    
    
    // MARK: outOfDrawerSlotsAlertGenerator
    /// this will gernerate an alert to let the user know there's a out of drawer slots problem for a purticular category in the system
    /// if user accept to proceed with an OK, then this function will only transer labeled items to the next view
    func outOfDrawerSlotsAlertGenerator() {
        if selectedItemsArray.contains(where: { $0.labelID == "out of slots" }) {
            alertItemForOrganizing = AlertItemModel(
                title: "Out of Drawer Slots",
                message: "The system can't generate a label for some items.\nAre you sure you want to continue without the label-less items?",
                dismissButton: .cancel(),
                primaryButton: .default(Text("OK")) {
                    self.isOutOfSlotsAlertAccepted = true
                    self.selectedItemsArray.removeAll(where: { $0.labelID == "out of slots" })
                }
            )
        } else {
            isOutOfSlotsAlertAccepted = true
        }
    }
    
    
    // MARK: drawerSlotsDefiner
    /// this will assign the closest highest number to drawer label ids when we have short name for  more than one drawer
    func drawerSlotsDefiner() {
        
        var tempDrawersSlotsArray = [DrawerSlotModel]()
        var previousItem: DrawerSlotsDefineModel?
        
        for item in drawerSlotsDefineArray {
            
            var labelIDsArray = [String]()
            
            for number in 1...item.slotsCount {
                
                if let previousItem = previousItem {
                    
                    if previousItem.shortName == item.shortName {
                        
                        let lastLabelID: String = tempDrawersSlotsArray.last?.slotsArray.last ?? ""
                        let lastLabelIDNo: Int = Int(lastLabelID.suffix(2)) ?? 0
                        
                        let tempLabelID: String = "\(item.shortName.rawValue) \(String(format: "%02d", number+lastLabelIDNo))"
                        labelIDsArray.append(tempLabelID)
                    } else {
                        let tempLabelID: String = "\(item.shortName.rawValue) \(String(format: "%02d", number))"
                        labelIDsArray.append(tempLabelID)
                    }
                } else {
                    let tempLabelID: String = "\(item.shortName.rawValue) \(String(format: "%02d", number))"
                    labelIDsArray.append(tempLabelID)
                }
            }
            
            let drawerSlots = DrawerSlotModel(slotsArray: labelIDsArray, middleLayer: item.middleLayer)
            tempDrawersSlotsArray.append(drawerSlots)
            
            previousItem = item
        }
        
        drawersSlotsArray = tempDrawersSlotsArray
    }
    
    
    // MARK: getMiddleLayersFromSelectedItems
    /// once the user has been selected the items that needs to be labelised, this function will dicide what drawers need to be opened
    func getMiddleLayersFromSelectedItems() {
        var tempMiddleLayerArray: [WardrobeMiddleLayerTypes] = []
        
        for item in selectedItemsArray {
            if let index: Int = drawersSlotsArray.firstIndex(where: { $0.slotsArray.contains(where: { $0 == item.labelID }) }) {
                let middleLayer: WardrobeMiddleLayerTypes = drawersSlotsArray[index].middleLayer
                if !middleLayerArray.contains(where: { $0 == middleLayer }) {
                    tempMiddleLayerArray.append(middleLayer)
                }
            }
        }
        
        middleLayerArray = tempMiddleLayerArray
    }
}
