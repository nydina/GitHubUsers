//
//  UserDetail.swift
//  GitHubUsers
//
//  Created by Dina Andrianarijaona on 27/09/2022.
//

import SwiftUI

struct UserDetail: View {
    var user: User
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: user.avatarURL)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(30)
                            .frame(width: 100, height: 100)
                        
                    case .failure:
                        Image(systemName: "photo")
                    @unknown default:
                        EmptyView()
                    }
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Text("\(user.name)")
                        .font(.headline)
                    Text("\(user.publicRepo) repositories")
                    HStack {
                        Text("\(user.followers) followers")
                        
                        Text("\(user.following) following")
                        
                    }
                    .padding(.top)
                    .font(.caption)
                }
            }
            HStack {
                
                Link("Message", destination: URL(string: "https://twitter.com/\(user.twitterUsername ?? "")")!)
                    
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.cyan)
                    .cornerRadius(30)
                Link("Voir le profil complet", destination: URL(string: user.htmlURL)!)
                    .foregroundColor(.cyan)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.cyan, lineWidth: 1)
                    )
               
                
                
            }
        
                Text(user.bio ?? "")
                    .padding()
                
            
        }
    }
}

struct UserDetail_Previews: PreviewProvider {
    static var previews: some View {
        UserDetail(user: User(login: "nydina", id: 0, nodeID: "", avatarURL: "https://avatars.githubusercontent.com/u/63366733?v=4", bio: "J'ai décidé de coder pendant le confinement et depuis j'apprends à coder. ",twitterUsername: "DinaSourira", publicRepo: 8, name: "Ny Dina Razafindratsira", htmlURL: "https://github.com/nydina", followers: 1, following: 1))
    }
}
