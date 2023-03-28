//
//  ResponseModel.swift
//  FriendsApp
//
//  Created by Shakhawat Hossain Shahin on 29/3/23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let responseModel = try? JSONDecoder().decode(ResponseModel.self, from: jsonData)

import Foundation

// MARK: - ResponseModel
struct ResponseModel<T: Codable>: Codable {
    let results: [T]?
    let info: Info?
}

// MARK: - Info
struct Info: Codable {
    let seed: String?
    let results, page: Int?
    let version: String?
}


