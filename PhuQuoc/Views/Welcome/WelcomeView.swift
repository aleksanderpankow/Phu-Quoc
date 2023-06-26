//
//  WelcomeView.swift
//  PhuQuoc
//
//  Created by Aleksander Pankow on 25/06/2023.
//

import SwiftUI
import SwiftUIX

struct WelcomeView: View {
    @State private var isSheetPresented = false
    @State var userIsLoggedIn = false
    
    var body: some View {
        ZStack(alignment:.bottom){
            
            Image("welcome")
                .resizable()
                .scaledToFill()
            
            LinearGradient(colors: [
                Color.white.opacity(0),
                Color("primaryBlue").opacity(0.6)
            ], startPoint: .top, endPoint: .bottom)
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 50.0){
                
                Text("Explore the Best Places in Phu Quoc: Unveiling the Island's Hidden Gems!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
                Button(action: {
                    // Handle image tap action here
                    isSheetPresented = true
                    print("Image tapped!")
                }) {
                        Text("Let's Go!")
                            .font(.title3)
                            .fontWeight(.bold)
                            .textCase(.uppercase)
                            .foregroundColor(Color("primaryYellow"))
                            .padding(.horizontal, 30)
                            .padding(.vertical, 15)
                            .background(Blur(style: .systemUltraThinMaterialLight))
                            .mask(RoundedRectangle(cornerRadius: 15, style: .continuous))
                            .overlay(RoundedRectangle(cornerRadius: 15, style: .continuous).stroke(lineWidth: 0.5).fill(.white.opacity(0.5)))
                            .offset(x: 5)
                    
                        
            
                }
                //.shadow(color: .black.opacity(0.3), radius: 20, x: 10, y: 15)

            }
            .padding(.horizontal)
            .padding(.bottom, 40)
            
        }
        .ignoresSafeArea(.all)
        .sheet(isPresented: $isSheetPresented){
            LoginView()
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
