//
//  ImageLoaderView.swift
//  FriendsApp
//
//  Created by Shakhawat Hossain Shahin on 29/3/23.
//

import SwiftUI

struct ImageLoaderView: View {
    
    @StateObject var vm: ImageLoaderViewModel
    
    init(url: String) {
        _vm = StateObject(wrappedValue: ImageLoaderViewModel(url: url))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color.gray)
            }
        }
    }
}

struct ImageLoaderView_Previews: PreviewProvider {
    static var previews: some View {
        ImageLoaderView(url: AppConstants.baseUrl + "portraits/men/93.jpg")
    }
}
