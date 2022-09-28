//
//  ContentView.swift
//  GitHubUsers
//
//  Created by Dina Andrianarijaona on 27/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State var user = User(login: "", id: 0, nodeID: "", avatarURL: "", bio: "",twitterUsername: "", publicRepo: 0, name: "", htmlURL: "", followers: 0, following: 0)
    
    @State private var usernameToSearch = ""
    
    var body: some View {
        NavigationView {
            VStack {
                if usernameToSearch == "" && user.login == usernameToSearch {
                    Text("")
                }
                
                if user.login != "" {
                    UserDetail(user: user)
                }
                Spacer()
                
                
            }
            .searchable(text: $usernameToSearch, placement: .navigationBarDrawer(displayMode: .always))
            .onSubmit(of: .search) {
                Task {
                    user = try await getUser(username: usernameToSearch)}
            }
            .navigationTitle("Find GitHub Users")
        }.accentColor(.cyan)
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
