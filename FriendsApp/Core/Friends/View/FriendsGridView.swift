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
            // Unwraping Optional friend List
            if let friends = vm.friendsList {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 256), spacing: 8)]) {
                        // Didn't use Identifiable protocal since we have uuid under login object
                        ForEach(friends, id: \.login?.uuid) { friend in
                            // Navigating and showing the data
                            NavigationLink {
                                FriendsDetailsView(friend: friend)
                            } label: {
                                FriendGridItemView(friend: friend)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                .navigationTitle(Text("Friends"))
                .toolbar {
                    Button("Refresh") {
                        vm.getFriends()
                    }
                }
                
            } else {
                NoDataView(message: "Something wrong happened") {
                    vm.getFriends()
                }
            }
            
//            if vm.friendsList.isEmpty {
//                NoDataView()
//            }
            
            if vm.showLoader {
                ProgressView()
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
