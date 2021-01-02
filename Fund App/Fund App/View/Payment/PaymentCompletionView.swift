//
//  PaymentCompletionView.swift
//  Fund App
//
//  Created by 中筋淳朗 on 2020/12/14.
//

import SwiftUI

struct PaymentCompletionView: View {
    
    // MARK: - Property
    
    @ObservedObject var ddManager: DragDropManager
    
    @Binding var paymentConfig: PaymentConfig
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            // MARK: - Default
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.bgColor)
                    .frame(width: 80, height: 80)
                    .rotationEffect(Angle(degrees: paymentConfig.faceIDSuccess ? 0 : 360))
                    .animation(.linear(duration: 1))
                    .opacity(paymentConfig.faceIDSuccess ? 0 : 1)

                Image(systemName: "touchid")
                    .font(.system(size: 40, weight: .ultraLight))
                    .foregroundColor(.normalColor)
                    .opacity(paymentConfig.faceIDSuccess ? 0 : 1)
            } //: ZStack
            .shadow(color: .shadow, radius: 30, x: 14, y: 30)
            .onTapGesture {
                withAnimation {
                    paymentConfig.faceIDSuccess = true
                }
            }
            
            // MARK: - Success
            ZStack {
                Circle()
                    .fill(Color.bgColor)
                    .opacity(paymentConfig.faceIDSuccess ? 1 : 0)
                
                CheckmarkShape()
                    .trim(from: 0, to: paymentConfig.faceIDSuccess ? 1 : 0)
                    .stroke(style: StrokeStyle(lineWidth: 1.5, lineCap: .round, lineJoin: .round))
                    .foregroundColor(.darkGreen)
                    .offset(x: -6, y: -6)
                    .scaleEffect(0.9)
            } //: ZStack
            .animation(Animation.linear(duration: 0.4).delay(0.7))
            .frame(width: 80, height: 80)
            .shadow(color: .shadow, radius: 30, x: 14, y: 30)
            .onTapGesture {
                withAnimation (.easeOut(duration: 0.8)) {
                    paymentConfig.dismissAnimation = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                    ddManager.config.isDroppedOnPayment = false
                }
            }
        } //: ZStack
    }
}

// MARK: - Preview

struct PaymentCompletionView_Previews: PreviewProvider {
    @Namespace static var matchAnimation
    @ObservedObject static var ddManager = DragDropManager()
    
    static var previews: some View {
        PaymentView(ddManager: ddManager, matchAnimation: matchAnimation)
    }
}
