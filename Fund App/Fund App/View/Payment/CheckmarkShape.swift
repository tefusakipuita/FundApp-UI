//
//  CheckmarkShape.swift
//  Fund App
//
//  Created by 中筋淳朗 on 2020/12/14.
//

import SwiftUI

struct CheckmarkShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 25, y: 50))
        
        path.addLine(to: CGPoint(x: 40, y: 65))
        path.addLine(to: CGPoint(x: 70, y: 35))
        
        return path
    }
}
