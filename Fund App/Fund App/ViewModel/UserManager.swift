//
//  UserManager.swift
//  Fund App
//
//  Created by 中筋淳朗 on 2020/12/13.
//

import SwiftUI

class UserManager: ObservableObject {
    
    // MARK: - Property
    
    @Published var userData = Data.users
}
