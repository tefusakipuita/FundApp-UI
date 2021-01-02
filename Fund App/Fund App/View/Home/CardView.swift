//
//  CardView.swift
//  Fund App
//
//  Created by 中筋淳朗 on 2020/12/13.
//

import SwiftUI

struct CardView: View {
    
    // MARK: - Property
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            // MARK: - Background
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.mainGradient)
                .shadow(color: .shadow, radius: 30, x: 14, y: 30)
            
            // MARK: - Card Info
            VStack (alignment: .leading) {
                
                // MARK: - Top
                HStack (alignment: .top) {
                    VStack (alignment: .leading) {
                        Text("Hello, Tefumaru")
                        
                        Text("Balance")
                    } //: VStack
                    .font(.system(size: 20))
                    
                    Spacer(minLength: 0)
                    
                    Text("P")
                        .italic()
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.darkGreen)
                } //: HStack
                .foregroundColor(.normalColor)
                
                Spacer(minLength: 0)
                
                // MARK: - Money
                Text("$ 9844.00")
                    .font(.system(size: 26, weight: .semibold))
                
                Spacer(minLength: 0)
                
                // MARK: - Bottom
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.mainGradient)
                        .frame(height: 50)
                        .shadow(color: .shadow, radius: 20, x: 8, y: 12)
                    
                    HStack {
                        Text("Your Transaction")
                        
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .font(.system(size: 18))
                    } //: HStack
                    .padding(.horizontal, 14)
                } //: ZStack
            } //: VStack
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
        } //: ZStack
        .frame(width: CGFloat.cardWidth, height: CGFloat.cardHeight)
    }
}

// MARK: - Preview

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
