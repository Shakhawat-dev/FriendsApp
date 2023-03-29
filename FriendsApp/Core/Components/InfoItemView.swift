//
//  InfoItemView.swift
//  FriendsApp
//
//  Created by Shakhawat Hossain Shahin on 29/3/23.
//

import SwiftUI

struct InfoItemView: View {
    var title: String
    var data: String
    
    var body: some View {
        HStack {
            Text("\(title) : ")
            Text(data)
        }
    }
}

struct InfoItemView_Previews: PreviewProvider {
    static var previews: some View {
        InfoItemView(title: "Name", data: "Shakhawat Hossain")
    }
}
