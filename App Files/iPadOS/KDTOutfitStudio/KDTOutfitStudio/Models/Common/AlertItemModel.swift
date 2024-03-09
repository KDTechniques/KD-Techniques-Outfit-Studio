//
//  AlertItemModel.swift
//  KDTOutfitStudio
//
//  Created by Mr. Kavinda Dilshan on 2022-07-13.
//

import Foundation
import SwiftUI

struct AlertItemModel: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    var dismissButton: Alert.Button?
    var primaryButton: Alert.Button?
}
