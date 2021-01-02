//
//  MenuSelectionView.swift
//  Fund App
//
//  Created by 中筋淳朗 on 2020/12/13.
//

import SwiftUI

struct MenuSelectionView: View {
    
    // MARK: - Property
    
    @ObservedObject var ddManager: DragDropManager
    
    var matchAnimation: Namespace.ID
    
    
    // MARK: - Body
    
    var body: some View {
        HStack (spacing: 28) {
            
            // MARK: - Left Menu
            // MenuItem の CGRect を取得するために GeometryReader を使う (ドロップ用)
            GeometryReader(content: { geometry in
                MenuItem(imageName: "creditcard.fill",
                         title: "Payment",
                         didEntered: ddManager.config.isEnteredPayment)
                    .matchedGeometryEffect(id: "Payment", in: matchAnimation)
                    // 画面表示と同時に MenuItem のRectを取得して用意しておいた変数に入れる
                    .onAppear(perform: {
                        ddManager.paymentViewRect = geometry.frame(in: .global)
                    })
            })
            .frame(height: CGFloat.menuWidth)
            
            // MARK: - Right Menu
            GeometryReader(content: { geometry in
                MenuItem(imageName: "dollarsign.circle",
                         title: "Collect Money",
                         didEntered: ddManager.config.isEnteredCollect)
                    .onAppear(perform: {
                        ddManager.collectViewRect = geometry.frame(in: .global)
                    })
            })
            .frame(height: CGFloat.menuWidth)
        } //: HStack
        .padding(.horizontal, 35)
    }
}

// MARK: - Preview

struct MenuSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
