//
//  ReceivedData.swift
//  Apollo
//
//  Created by QUANG HUNG on 15/Nov/2021.
//

import Foundation

struct ReceivedData: Decodable {
    let user: User
    let role:String
    let token: Token
}
