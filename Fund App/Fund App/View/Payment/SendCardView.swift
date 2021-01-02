//
//  SendCardView.swift
//  Fund App
//
//  Created by 中筋淳朗 on 2020/12/14.
//

import SwiftUI

struct SendCardView: View {
    
    // MARK: - Property
    
    @State var paymentConfig: PaymentConfig
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            // MARK: - Background
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.mainGradient)
            
            VStack {
                // MARK: - Top
                HStack {
                    Text("Credit Card")
                        .foregroundColor(.normalColor)
                        .font(.system(size: 20))
                    
                    Spacer()
                    
                    Image(systemName: "wave.3.right")
                        .foregroundColor(.darkGreen)
                        .font(.system(size: 30, weight: .bold))
                } //: HStack
                
                Spacer(minLength: 0)
                
                // MARK: - Middle
                HStack {
                    Image(systemName: "simcard")
                        .foregroundColor(.normalColor)
                        .font(.system(size: 40, weight: .thin))
                        .rotationEffect(Angle(degrees: 90))
                    
                    Spacer()
                    
                    Text("**** **** **** 8944")
                        .font(.system(size: 22, weight: .light))
                } //: HStack
                .padding(.bottom, 2)
                
                // MARK: - Bottom
                HStack {
                    VStack (alignment: .leading) {
                        Text("Card Holder")
                            .font(.system(size: 13, weight: .light))
                        
                        Text("Tefumaru")
                            .font(.system(size: 15))
                    } //: VStack
                    
                    Spacer()
                    
                    Text("Visa".uppercased())
                        .italic()
                        .font(.system(size: 30, weight: .bold))
                } //: HStack
                .foregroundColor(.normalColor)
            } //: VStack
            .padding(20)
        } //: ZStack
        .frame(width: CGFloat.cardWidth, height: paymentConfig.showCard ? CGFloat.cardHeight : 0)
        .opacity(paymentConfig.showCard ? 1 : 0)
    }
}

// MARK: - Preview

struct SendCardView_Previews: PreviewProvider {
    @Namespace static var matchAnimation
    @ObservedObject static var ddManager = DragDropManager()
    
    static var previews: some View {
        PaymentView(ddManager: ddManager, matchAnimation: matchAnimation)
    }
}
