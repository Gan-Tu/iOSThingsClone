//
//  HomeViewModel.swift
//  ThingsClone
//
//  Created by Gan Tu on 7/10/23.
//

import Foundation
import SwiftUI

class HomeViewModel : ObservableObject {
    @Published var selectedItemId: String?
    
    public var hasSelectedItem: Bool {
        selectedItemId != nil && !(selectedItemId!.isEmpty)
    }
    
    public func updateSelectedItemId(_ id: String?) {
        selectedItemId = id
    }
}
