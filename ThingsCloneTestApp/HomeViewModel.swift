//
//  HomeViewModel.swift
//  ThingsCloneTestApp
//
//  Created by Gan Tu on 7/10/23.
//

import Foundation
import SwiftUI

class HomeViewModel : ObservableObject {
    @Published var selectedItemId: String?
    
    public func updateSelectedItemId(_ id: String?) {
        selectedItemId = id
    }
}
