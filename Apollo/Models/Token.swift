//
//  Token.swift
//  Apollo
//
//  Created by QUANG HUNG on 15/Nov/2021.
//

import Foundation

struct Token: Decodable {
    let expiresIn: Int
    let accessToken: String
}
