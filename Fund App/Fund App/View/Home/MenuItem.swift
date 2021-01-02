//
//  MenuItem.swift
//  Fund App
//
//  Created by 中筋淳朗 on 2020/12/13.
//

import SwiftUI

struct MenuItem: View {
    
    // MARK: - Property

    let imageName: String
    let title: String
    
    var didEntered = false
    
    
    // MARK: - Body
    
    var body: some View {
        
        ZStack (alignment: .leading) {
            // MARK: - Background
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.mainGradient)
                .frame(width: CGFloat.menuWidth, height: CGFloat.menuWidth)
                .shadow(color: .shadow, radius: 30, x: 14, y: 30)
            
            // MARK: - Image & Text
            VStack (alignment: .leading, spacing: 12) {
                ZStack {
                    Circle()
                        .fill(Color.greenGradient)
                        .frame(width: 40, height: 40)
                    
                    Image(systemName: imageName)
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                } //: ZStack
                
                Text(title)
                    .fontWeight(.light)
            } //: VStack
            .padding(.leading, 16)
        } //: ZSatck
        // hover時にMenuItemを拡大させる
        .scaleEffect(didEntered ? 1.1 : 1)
        .animation(.spring())
    }
}

// MARK: - Preview

struct MenuItem_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
