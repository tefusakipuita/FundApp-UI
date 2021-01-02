//
//  PaymentView.swift
//  Fund App
//
//  Created by 中筋淳朗 on 2020/12/13.
//

import SwiftUI

struct PaymentView: View {
    
    // MARK: - Property
    
    @ObservedObject var ddManager: DragDropManager
    
    var matchAnimation: Namespace.ID
    
    @ObservedObject var paymentManager = PaymentManager()
    @State var paymentConfig = PaymentConfig()
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            // MARK: - Background
            Color.black.opacity(0.85)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    withAnimation {
                        ddManager.config.isDroppedOnPayment = false
                    }
                }
            
            ZStack {
                // MARK: - Rounded Background
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.bgColor)
                    .edgesIgnoringSafeArea(.bottom)
                    .matchedGeometryEffect(id: "Payment", in: matchAnimation)
                
                VStack {
                    ZStack {
                        // MARK: - User Shadow
                        Circle()
                            .trim(from: 0, to: 0.5)
                            .fill(Color.bgColor)
                            .frame(width: 120, height: 120)
                            .shadow(color: .shadow, radius: 30, x: 14, y: 30)
                        
                        // MARK: - User View
                        Circle()
                            .fill(Color.bgColor)
                            .frame(width: 120, height: 120)

                        Image(ddManager.pickedUser.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 110, height: 110)
                            .clipShape(Circle())
                    } //: ZStack
                    .padding(.top, -60)
                    .padding(.bottom, 18)
                    .scaleEffect(paymentConfig.appearAnimatoin ? 1 : 0)
                    
                    // MARK: - User Name
                    HStack (spacing: 12) {
                        Text("Transfer to")
                            .font(.system(size: 18, weight: .light))
                        
                        Text(ddManager.pickedUser.name)
                            .font(.system(size: 26, weight: .light))
                    } //: HStack
                    
                    // MARK: - Text Field
                    HStack {
                        Text("$")
                        
                        Text(paymentManager.amount)
                        
                        Capsule()
                            .fill(Color.normalColor)
                            .frame(width: 2, height: 40)
                            .opacity(paymentConfig.blink ? 1 : 0)
                            .opacity(paymentConfig.showCard ? 0 : 1)
                    } //: HStack
                    .font(.system(size: 50, weight: .regular))
                    .padding(.horizontal, 35)
                    
                    Spacer()
                    
                    HStack (spacing: 14) {
                        // MARK: - USD
                        ZStack {
                            Capsule()
                                .fill(Color.bgColor)
                                .frame(width: 110, height: 60)
                                .shadow(color: .shadow, radius: 30, x: 14, y: 30)
                            
                            HStack {
                                Text("🇺🇸")
                                    .scaleEffect(1.8)
                                    .clipShape(Circle())
                                    .font(.system(size: 22))
                                
                                Text("USD")
                                    .font(.system(size: 24, weight: .light))
                            } //: HStack
                        } //: ZStack
                        
                        // MARK: - Say Something
                        ZStack (alignment: .leading) {
                            Capsule()
                                .fill(Color.bgColor)
                                .frame(height: 60)
                                .shadow(color: .shadow, radius: 30, x: 14, y: 30)
                                
                            TextField("Say something", text: .constant(""))
                                .font(.system(size: 20))
                                .padding(.leading, 18)
                        } //: ZStack
                    } //: HStack
                    .padding(.horizontal, 35)
                    .padding(.bottom, 16)
                    .opacity(paymentConfig.appearAnimatoin ? 1 : 0)
                    .opacity(paymentConfig.showCard ? 0 : 1)
                    .frame(width: paymentConfig.showCard ? 0 : nil)
                    
                    // MARK: - Number Pad
                    KeyPadView(paymentManager: paymentManager, paymentConfig: $paymentConfig)
                        .padding(.horizontal, 35)
                        .offset(y: paymentConfig.appearAnimatoin ? 0 : 300)
                        .opacity(paymentConfig.showCard ? 0 : 1)
                        .frame(width: paymentConfig.showCard ? 0 : nil)
                } //: VStack
                .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            } //: ZStack
            .padding(.top, paymentConfig.topPadding)
            
            
            if paymentConfig.showCard {
                VStack {
                    // MARK: - Card View
                    SendCardView(paymentConfig: paymentConfig)
                        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                        .padding(.top, 15)
                    
                    Spacer()
                    
                    // MARK: - Completion
                    PaymentCompletionView(ddManager: ddManager, paymentConfig: $paymentConfig)
                        .padding(.bottom, 100)
                } //: VStack
                .frame(height: UIScreen.screenHeight)
            }
            
        } //: ZStack
        .opacity(paymentConfig.dismissAnimation ? 0 : 1)
        .onAppear(perform: {
            withAnimation(Animation.easeOut(duration: 0.7).repeatForever()) {
                paymentConfig.blink = true
            }
            withAnimation {
                paymentConfig.appearAnimatoin = true
            }
        })
    }
}

// MARK: - Preview

struct PaymentView_Previews: PreviewProvider {
    @Namespace static var matchAnimation
    @ObservedObject static var ddManager = DragDropManager()
    
    static var previews: some View {
        PaymentView(ddManager: ddManager, matchAnimation: matchAnimation)
    }
}
