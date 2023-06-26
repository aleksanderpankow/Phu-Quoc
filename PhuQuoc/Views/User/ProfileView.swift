//
//  ProfileView.swift
//  PhuQuoc
//
//  Created by Aleksander Pankow on 10/06/2023.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    
    @StateObject private var authViewModel = AuthViewModel()
    
    var body: some View {
        ZStack{
            VStack{
                Text("Profile")
                Button(action: {
                    authViewModel.signOut()
                    print("Image tapped!")
                }) {
                    Text("Logout")
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
