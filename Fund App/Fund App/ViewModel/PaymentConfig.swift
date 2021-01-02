//
//  PaymentConfig.swift
//  Fund App
//
//  Created by 中筋淳朗 on 2020/12/14.
//

import SwiftUI

struct PaymentConfig {
    
    var blink = false  // 点滅アニメーション用
    var appearAnimatoin = false  // 表示アニメーション用
    var showCard = false  // Sendボタンを押した時のカード表示アニメーション
    var faceIDSuccess = false  // 認証アニメーション
    var dismissAnimation = false
    var topPadding: CGFloat = 150
}
