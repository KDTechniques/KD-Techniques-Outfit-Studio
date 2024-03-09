//
//  UnwornItemModel.swift
//  KDTOutfitStudio
//
//  Created by Mr. Kavinda Dilshan on 2022-07-09.
//

import Foundation

struct UnwornItemModel: Identifiable {
    
    let id: String = UUID().uuidString
    let imageName: String
    let itemName: String
    let categoryName: CategoryTypes
}
