//
//  ContentView.swift
//  Fund App
//
//  Created by 中筋淳朗 on 2020/12/13.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Property
    
    @ObservedObject var userManager = UserManager()
    @ObservedObject var ddManager = DragDropManager()
    
    @Namespace var matchAnimation
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            // MARK: - Background
            Color.bgColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                // MARK: - Top Bar
                TopBarView()
                    .padding(.bottom, 26)
                
                // MARK: - Card
                CardView()
                    .padding(.bottom, 30)
                
                // MARK: - Menu Selection
                MenuSelectionView(ddManager: ddManager, matchAnimation: matchAnimation)
                    .padding(.bottom, 32)
                
                // MARK: - Recently Traded Title
                HStack {
                    Text("Recently traded")
                        .font(.system(size: 22))
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                } //: HStack
                .padding(.horizontal, 35)
                
                // MARK: - Recently Traded
                RecentlyTradedView(userManager: userManager, ddManager: ddManager)
                    .frame(height: CGFloat.largeCircleSize * 0.85)
                    .offset(y: CGFloat.largeCircleSize * 0.15)
            } //: VStack
            
            // MARK: - Payment View
            if ddManager.config.isDroppedOnPayment {
                PaymentView(ddManager: ddManager, matchAnimation: matchAnimation)
            }
            
            // MARK: - Collect View
            if ddManager.config.isDroppedOnCollect {
                
            }
        } //: ZStack
        .edgesIgnoringSafeArea(.bottom)
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
