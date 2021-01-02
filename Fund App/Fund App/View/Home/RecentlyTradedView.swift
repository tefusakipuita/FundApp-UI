//
//  Recentle.swift
//  Fund App
//
//  Created by 中筋淳朗 on 2020/12/13.
//

import SwiftUI

struct RecentlyTradedView: View {
    
    // MARK: - Property
    
    @ObservedObject var userManager: UserManager
    @ObservedObject var ddManager: DragDropManager
    
    @State var rotationAnimation = false
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            // MARK: - Background Rotation Path
            RotationPath()
            
            // MARK: - User Circle
            ForEach(userManager.userData) { user in
                UserView(user: user)
                    // ドラッグ状態の場合非表示にする
                    .opacity(ddManager.config.isDragging && ddManager.pickedUser.id == user.id ? 0 : 1)
                    .animation(nil)
                    // 下の処理で回転してしまった画像を元の角度に戻す
                    .rotationEffect(Angle(degrees: user.id < 3 ? -Double(user.id * 120) : -Double(user.id * 120 + 60)))
                    .rotationEffect(Angle(degrees: rotationAnimation ? -360 : 0))
                    // サークル上に配置
                    .offset(x: user.id < 3 ? CGFloat.middleCircleSize/2 : CGFloat.largeCircleSize/2)
                    .rotationEffect(Angle(degrees: user.id < 3 ? Double(user.id * 120) : Double(user.id * 120 + 60)))
                    // アニメーション
                    .rotationEffect(Angle(degrees: rotationAnimation ? 360 : 0))
                    .animation(Animation.linear(duration:user.id < 3 ?  10 : 8).repeatForever(autoreverses: false))
                    // Drag Gesture
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged({ value in
                                dragUser(value: value, user: user)
                            })
                            .onEnded({ value in
                                endDrag(value: value, user: user)
                            })
                    ) //: gesture
            } //: ForEach
            
            // MARK: - ※ ドラッグ中のユーザーサークル
            GeometryReader(content: { geometry in
                // 引数にドラッグしている pickedUser を入れる
                UserView(user: ddManager.pickedUser)
                    // ドラッグ中のみ表示させる
                    .opacity(ddManager.config.isDragging ? 1 : 0)
                    // - 30 はユーザーサークルの大きさを考慮
                    .offset(x: ddManager.offsetValue.x - 30, y: ddManager.offsetValue.y - 30)
                    // 画面表示と同時に、ユーザーサークルのRectを取得
                    .onAppear(perform: {
                        ddManager.userViewRect = geometry.frame(in: .global)
                        // Rect の左上をCGPointとして取得 (初期値の座標)
                        ddManager.dragUserMovingPoint = CGPoint(
                            x: ddManager.userViewRect.minX,
                            y: ddManager.userViewRect.minY)
                    })
            }) //: GeometryReader
            .frame(width: CGFloat.userCircleSize, height: CGFloat.userCircleSize)
            
        } //: ZStack
        .onAppear(perform: {
            rotationAnimation = true
        })
    }
    
    
    // MARK: - Function
    
        // MARK: - OnChange
    func dragUser(value: DragGesture.Value, user: User) {
        // isDragging をtrueにしてドラッグ用のUserViewのopacityを1にして可視化する
        ddManager.config.isDragging = true
        // pickedUser にドラッグしているユーザー情報を入れる (ドラッグ用のUserViewの画像を最適化する)
        ddManager.pickedUser = user
        
        // ドラッグしている位置の分だけoffsetさせる
        ddManager.offsetValue = value.location
        
        // dragUserMovingPoint の更新 (初期値 + ドラッグによるoffset分 - サークルの半径)
        ddManager.dragUserMovingPoint = CGPoint(
            x: ddManager.userViewRect.minX + ddManager.offsetValue.x - 30,
            y: ddManager.userViewRect.minY + ddManager.offsetValue.y - 30)
        
        // dragUserMovingPoint を考慮して、ユーザーサークルのRectの更新
        let userRect = CGRect(
            x: ddManager.dragUserMovingPoint.x,
            y: ddManager.dragUserMovingPoint.y,
            width: CGFloat.userCircleSize,
            height: CGFloat.userCircleSize)
        
        // ユーザーサークルのRect と　PaymentのMenuItemのRect が重なっている(hoverしている)場合
        if ddManager.paymentViewRect.intersects(userRect) {
            ddManager.config.isEnteredCollect = false
            ddManager.config.isEnteredPayment = true
        }
        else if ddManager.collectViewRect.intersects(userRect) {
            ddManager.config.isEnteredPayment = false
            ddManager.config.isEnteredCollect = true
        }
        else {
            ddManager.config.isEnteredPayment = false
            ddManager.config.isEnteredCollect = false
        }
    }
    
        // MARK: - OnEnded
    func endDrag(value: DragGesture.Value, user: User) {
        ddManager.config.isDragging = false  // isDragging をfalseに戻す
        ddManager.offsetValue = CGPoint(x: 0, y: 0)  // offsetValue も０に戻す
        ddManager.dragUserMovingPoint = CGPoint(x: 0, y: 0)
        
        // 『Payment』の MenuItem 上でドロップした場合
        if ddManager.config.isEnteredPayment {
            // hover 状態の判定を元に戻す
            ddManager.config.isEnteredPayment = false
            withAnimation {
                // isDroppedOnPayment をtrueにして、支払い用のViewを表示させる
                ddManager.config.isDroppedOnPayment = true
            }
        }
        // 『Collect』の MenuItem 上でドロップした場合
        if ddManager.config.isEnteredCollect {
            ddManager.config.isEnteredCollect = false
            
            withAnimation {
                ddManager.config.isDroppedOnCollect = true
            }
        }
    }
}

// MARK: - Preview

struct Recentle_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
