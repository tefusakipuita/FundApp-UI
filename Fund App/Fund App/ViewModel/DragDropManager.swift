//
//  UserDragDropManager.swift
//  Fund App
//
//  Created by 中筋淳朗 on 2020/12/13.
//

import SwiftUI

class DragDropManager: ObservableObject {
    
    // ドロップする『Payment』『Collect』、『ユーザーサークル』のRect(位置と大きさ)
    // 初期値のみで、ユーザーサークルをドラッグしても更新・変更はしない
    var paymentViewRect = CGRect()
    var collectViewRect = CGRect()
    var userViewRect = CGRect()
    
    // Bool値を持つ変数をまとめておく
    @Published var config = DragDropConfig()
    
    // ドラッグされているユーザー
    @Published var pickedUser = Data.users[0]
    
    // ドラッグ量
    @Published var dragUserMovingPoint = CGPoint()  //  Rect の左上のCGPoint
    @Published var offsetValue = CGPoint(x: 0, y: 0)  // ドラッグ中の位置
}
