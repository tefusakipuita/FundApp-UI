//
//  PaymentManager.swift
//  Fund App
//
//  Created by 中筋淳朗 on 2020/12/14.
//

import SwiftUI

class PaymentManager: ObservableObject {
    
    // MARK: - Property
    
    @Published var amount = ""
    
    
    // MARK: - Function
    
    func addNumbers(number: String) {
        // 7桁以上は入力させない
        if amount.count < 7 {
            if number != "." {  // "."以外の場合はそのままappend
                amount.append(number)
            }
            // "."でかつ、まだ amount に"."が含まれていないならappend
            else if (number == "." && !amount.contains(".")) {
                amount.append(number)
            }
        }
    }
    
    func backSpace() {
        if amount.count > 0 {
            amount.removeLast()
        }
    }
}
