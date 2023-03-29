//
//  FriendsViewModel.swift
//  FriendsApp
//
//  Created by Shakhawat Hossain Shahin on 29/3/23.
//

import Foundation
import Combine

class FriendsViewModel: ObservableObject {
    @Published var friendsResponse: ResponseModel<UserModel>?
    @Published var friendsList: [UserModel] = []
    
    private let friendListService = FriendListService()
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published var showLoader: Bool = false
    
    init() {
        addSubscribers()
    }
    
    
    func addSubscribers() {
        friendListService.$response
            .sink { [weak self] (returnedFriends) in
                self?.friendsResponse = returnedFriends
                self?.friendsList.append(contentsOf: self?.friendsResponse?.results ?? [])
                self?.showLoader = false
//                print(returnedFriends)
            }
            .store(in: &cancellables)
    }
    
    func getFriends() {
        friendListService.getFriends()
    }
}
