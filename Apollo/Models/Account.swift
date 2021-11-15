//
//  Account.swift
//  Apollo
//
//  Created by QUANG HUNG on 15/Nov/2021.
//

import Foundation

struct Account: Encodable {
    let email: String // username
    let password: String // password
    let isMobileApp: Bool
}
