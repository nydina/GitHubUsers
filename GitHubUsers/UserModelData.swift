//
//  UserModelData.swift
//  GitHubUsers
//
//  Created by Dina Andrianarijaona on 27/09/2022.
//

import Foundation

struct User: Identifiable, Decodable {
    var login: String
    let id: Int
    let nodeID: String
    let avatarURL: String
    var bio: String
    var publicRepo: Int
    var name: String
    let htmlURL: String
    var followers: Int
    var following: Int

    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case bio
        case publicRepo = "public_repos"
        case name
        case htmlURL = "html_url"
        case followers, following
    }
}

func getUser(username: String) async throws -> User {
guard let url = URL(string: "https://api.github.com/users/\(username)")
else {
fatalError("Missing URL")
}
var urlRequest = URLRequest(url: url)
urlRequest.httpMethod = "GET"
let (data, response) = try await URLSession.shared.data(for: urlRequest)
guard (response as? HTTPURLResponse)?.statusCode == 200
else {
fatalError("Error while fetching data")
}
let decoded = try JSONDecoder().decode(User.self, from: data)
return decoded
}
