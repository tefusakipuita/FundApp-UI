//
//  TopBarView.swift
//  Fund App
//
//  Created by 中筋淳朗 on 2020/12/13.
//

import SwiftUI

struct TopBarView: View {
    
    // MARK: - Property
    
    
    // MARK: - Body
    
    var body: some View {
        HStack (spacing: 18) {
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "bell")
                    .font(.system(size: 22))
            })
            
            Button(action: {}, label: {
                Image(systemName: "ellipsis")
                    .font(.system(size: 22))
            })
        } //: HStack
        .foregroundColor(.black)
        .padding()
    }
}

// MARK: - Preview

struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
