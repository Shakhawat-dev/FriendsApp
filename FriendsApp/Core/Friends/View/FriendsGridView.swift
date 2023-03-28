//
//  FriendsGridView.swift
//  FriendsApp
//
//  Created by Shakhawat Hossain Shahin on 29/3/23.
//

import SwiftUI

struct FriendsGridView: View {
    @EnvironmentObject var vm: FriendsViewModel
    
    var body: some View {
        ZStack {
            if let friends = vm.friendsList {
//                List(friends, id: \.login?.uuid) { friend in
//                    Text("\(friend.name?.first ?? "")")
//                }
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 256), spacing: 8)]) {
                    ForEach(friends, id: \.login?.uuid) { friend in
                        VStack {
                            ImageLoaderView(url: friend.picture?.medium ?? "")
                            Text("\(friend.name?.title?.rawValue ?? "") \(  friend.name?.first ?? "")  \(friend.name?.last ?? "")")
                            Text(friend.location?.country ?? "")
                        }
                    }
                }
            }
            
        }
    }
}

struct FriendsGridView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsGridView()
            .environmentObject(FriendsViewModel())
    }
}
