//
//  User.swift
//  Apollo
//
//  Created by QUANG HUNG on 15/Nov/2021.
//

import Foundation

struct User: Decodable {
    let id: String?
    let createdAt: String?
    let updatedAt: String?
    let deletedAt: String?
    let name: String?
    let role: String?
    let schoolYear: String?
    let email: String?
    let mainClass: String?
    let studentCode: String?
}
