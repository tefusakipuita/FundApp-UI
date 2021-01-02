//
//  User.swift
//  Fund App
//
//  Created by 中筋淳朗 on 2020/12/13.
//

import SwiftUI

struct User: Identifiable {
    
    let id: Int
    let name: String
    let imageName: String
    
    var isDragging = false
}
