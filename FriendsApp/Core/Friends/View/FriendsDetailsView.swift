//
//  FriendsDetailsView.swift
//  FriendsApp
//
//  Created by Shakhawat Hossain Shahin on 29/3/23.
//

import SwiftUI

struct FriendsDetailsView: View {
    var friend: UserModel?
    
    
    var body: some View {
        ZStack {
            if let friend = friend {
                ScrollView {
                    VStack {
                        ImageLoaderView(url: friend.picture?.medium ?? "")
                            .frame(width: 256, height: 256)
                        
                        InfoItemView(title: "Full Name", data: "\(friend.name?.title?.rawValue ?? "") \(  friend.name?.first ?? "")  \(friend.name?.last ?? "")")
                        InfoItemView(title: "Address", data: "\(friend.location?.street?.number ?? 0) \(friend.location?.street?.name ?? "")  \(friend.name?.last ?? "")")
                        
                        InfoItemView(title: "City", data: friend.location?.city ?? "")
                        InfoItemView(title: "State", data: friend.location?.state ?? "")
                        InfoItemView(title: "Country", data: friend.location?.country ?? "")
                        InfoItemView(title: "Email", data: friend.email ?? "")
                        InfoItemView(title: "Cell Phone", data: friend.cell ?? "")
                        
                    }
                    .navigationTitle(Text(friend.name?.first ?? ""))
                }
                
            } else {
                NoDataView()
            }
            
        }
    }
}

struct FriendsDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsDetailsView()
            .environmentObject(FriendsViewModel())
    }
}
