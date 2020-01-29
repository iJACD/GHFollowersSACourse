//
//  User.swift
//  GHFollowersSACourse
//
//  Created by JohnAnthony on 1/29/20.
//  Copyright © 2020 iJACD. All rights reserved.
//

import Foundation

struct User: Codable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var htmlUrl: String
    var following: Int
    var followers: Int
    var createdAt: String
}
