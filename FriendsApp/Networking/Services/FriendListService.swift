//
//  FriendListService.swift
//  FriendsApp
//
//  Created by Shakhawat Hossain Shahin on 29/3/23.
//

import Foundation
import Combine

class FriendListService {
    @Published var response: ResponseModel<UserModel>?
    
    var friendsSubscription: AnyCancellable?
    
    init() {
        self.getFriends()
    }
    
    func getFriends(query: String = "results", size: Int = 4) {
        if query.isEmpty {
            return
        }
        
        guard var url = URL(string: AppConstants.baseUrl) else { return }
        url.appendQueryItem(name: query, value: "\(size)")
        
        friendsSubscription = NetworkManager.download(url: url)
            .decode(type: ResponseModel<UserModel>.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] returnedData in
                self?.response = returnedData
                print(self?.response)
                
            })
    }
}
