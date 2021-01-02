//
//  Extension.swift
//  Fund App
//
//  Created by 中筋淳朗 on 2020/12/13.
//

import SwiftUI



extension Color {
    
    static let bgColor = Color("bgColor")
    
    static let lightMain = Color("lightMain")
    static let darkMain = Color("darkMain")
    static let shadow = Color("shadow")
    
    static let normalColor = Color("normalColor")
    static let thinColor = Color("thinColor")
    
    static let lightGreen = Color("lightGreen")
    static let darkGreen = Color("darkGreen")
    
    
    static let mainGradient = LinearGradient(gradient: Gradient(colors: [Color.darkMain, Color.lightMain]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    static let greenGradient = LinearGradient(gradient: Gradient(colors: [Color.lightGreen, Color.darkGreen]), startPoint: .topLeading, endPoint: .bottomTrailing)
}


extension UIScreen {
    
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
}


extension CGFloat {
    
    static let cardWidth = UIScreen.screenWidth - 70
    static let cardHeight = (UIScreen.screenWidth - 70) * 0.6
    
    static let menuWidth = (UIScreen.screenWidth - 70 - 28) / 2
    
    static let largeCircleSize = UIScreen.screenWidth - 100
    static let middleCircleSize = UIScreen.screenWidth - 220
    static let smallCircleSize = UIScreen.screenWidth - 340
    
    static let userCircleSize: CGFloat = 60
    
    static let numberSize = (UIScreen.screenWidth - 70) / 4
}
