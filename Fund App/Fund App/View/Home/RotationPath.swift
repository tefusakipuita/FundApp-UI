//
//  RotationPath.swift
//  Fund App
//
//  Created by 中筋淳朗 on 2020/12/13.
//

import SwiftUI

struct RotationPath: View {
    
    // MARK: - Property
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(Color.normalColor, style: StrokeStyle(lineWidth: 1, dash: [8, 7]))
                .frame(width: CGFloat.largeCircleSize, height: CGFloat.largeCircleSize)
            
            Circle()
                .strokeBorder(Color.normalColor, style: StrokeStyle(lineWidth: 1, dash: [8, 7]))
                .frame(width: CGFloat.middleCircleSize, height: CGFloat.middleCircleSize)
            
            Circle()
                .strokeBorder(Color.normalColor, style: StrokeStyle(lineWidth: 1, dash: [8, 7]))
                .frame(width: CGFloat.smallCircleSize, height: CGFloat.smallCircleSize)
        } //: ZStack
    }
}

// MARK: - Preview

struct RotationPath_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
