//
//  DragDropConfig.swift
//  Fund App
//
//  Created by 中筋淳朗 on 2020/12/13.
//

import SwiftUI

struct DragDropConfig {
    
    // hover用
    var isEnteredPayment = false
    var isEnteredCollect = false
    
    // ドラッグ中かどうかのBool値 (ドラッグ中のユーザーサークルの opacity のコントロール)
    var isDragging = false
    
    // それぞれの MenuItem にドロップしたかどうかのBool値
    var isDroppedOnPayment = false
    var isDroppedOnCollect = false
}
