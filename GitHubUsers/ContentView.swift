//
//  ContentView.swift
//  GitHubUsers
//
//  Created by Dina Andrianarijaona on 27/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State var user = User(login: "", id: 0, nodeID: "", avatarURL: "", publicRepo: 0)
    
    @State private var usernameToSearch = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Button {
                    Task {
                        user = try await getUser(username: usernameToSearch)
                    }
                } label: {
                    Text("Search")
                }
                Text("")
                    .searchable(text: $usernameToSearch, placement: .navigationBarDrawer(displayMode: .always))
                    .onSubmit(of: .search) {
                        Task {
                            user = try await getUser(username: usernameToSearch)}
                    }
                if user.login != "" {
                    Text("\(user.nodeID)")
                    AsyncImage(url: URL(string: user.avatarURL))
                        .frame(width: 200, height: 200)
                        .cornerRadius(20)
                    Text("Number of public repositories: \(user.publicRepo)")
                }
            }
            .navigationTitle("Find GitHub Users")
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
