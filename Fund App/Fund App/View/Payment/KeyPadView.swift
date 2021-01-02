//
//  KeyPadView.swift
//  Fund App
//
//  Created by 中筋淳朗 on 2020/12/14.
//

import SwiftUI

struct KeyPadView: View {
    
    // MARK: - Property
    
    let numbers = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        ["0", "", "."]
    ]
    
    @ObservedObject var paymentManager: PaymentManager
    
    @Binding var paymentConfig: PaymentConfig
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            // MARK: - Background
            RoundedRectangle(cornerRadius: 40)
                .fill(Color.bgColor)
                .frame(height: UIScreen.screenWidth - 70)
//                .shadow(color: .shadow, radius: 30, x: 14, y: 30)
            
            HStack (spacing: 0) {
                // MARK: - Number
                VStack (spacing: 0) {
                    ForEach(numbers, id: \.self) { row in
                        HStack (spacing: 0) {
                            ForEach(row, id: \.self) { number in
                                Button(action: {
                                    paymentManager.addNumbers(number: number)
                                }, label: {
                                    Text(number)
                                        .frame(width: CGFloat.numberSize, height: CGFloat.numberSize)
                                }) //: Button
                            } //: ForEach
                        } //: HStack
                    } //: ForEach
                } //: VStack
                
                // MARK: - Right Button
                VStack (spacing: 0) {
                    Button(action: {
                        paymentManager.backSpace()
                    }, label: {
                        Image(systemName: "delete.left")
                            .frame(width: CGFloat.numberSize, height: CGFloat.numberSize)
                    })
                    
                    Button(action: {
                        withAnimation {
                            paymentConfig.showCard = true
                            paymentConfig.topPadding = 500
                        }
                    }, label: {
                        Text("Send")
                            .foregroundColor(.white)
                            .font(.system(size: 22))
                            .kerning(2.5)
                            .frame(width: CGFloat.numberSize, height: CGFloat.numberSize * 3)
                            .background(Color.greenGradient)
                    }) //: Button
                } //: VStack
            } //: HStack
            .foregroundColor(.black)
            .font(.system(size: 22, weight: .light))
            
        } //: ZStack
        .clipShape(RoundedRectangle(cornerRadius: 40))
        .shadow(color: .shadow, radius: 30, x: 14, y: 30)
    }
}

// MARK: - Preview

struct KeyPadView_Previews: PreviewProvider {
    @Namespace static var matchAnimation
    @ObservedObject static var ddManager = DragDropManager()
    
    static var previews: some View {
        PaymentView(ddManager: ddManager, matchAnimation: matchAnimation)
    }
}
