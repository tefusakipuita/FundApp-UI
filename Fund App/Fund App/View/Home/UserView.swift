//
//  UserView.swift
//  Fund App
//
//  Created by 中筋淳朗 on 2020/12/13.
//

import SwiftUI

struct UserView: View {
    
    // MARK: - Property
    
    let user: User
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.mainGradient)
                .frame(width: CGFloat.userCircleSize, height: CGFloat.userCircleSize)
                .shadow(color: Color.shadow, radius: 10, x: 6, y: 9)
            
            Image(user.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: CGFloat.userCircleSize - 10, height: CGFloat.userCircleSize - 10)
                .clipShape(Circle())
        } //: ZStack
    }
}

// MARK: - Preview

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
