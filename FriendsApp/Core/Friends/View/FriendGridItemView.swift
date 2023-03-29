//
//  FriendGridItemView.swift
//  FriendsApp
//
//  Created by Shakhawat Hossain Shahin on 29/3/23.
//

import SwiftUI

struct FriendGridItemView: View {
    var friend: UserModel?
    
    var body: some View {
        VStack {
            ImageLoaderView(url: friend?.picture?.medium ?? "")
            Text("\(friend?.name?.title?.rawValue ?? "") \(  friend?.name?.first ?? "")  \(friend?.name?.last ?? "")")
            Text(friend?.location?.country ?? "")
        }
    }
}

struct FriendGridItemView_Previews: PreviewProvider {
    static var previews: some View {
        FriendGridItemView()
    }
}
