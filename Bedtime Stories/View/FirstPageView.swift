//
//  ContentView.swift
//  Bedtime Stories
//
//  Created by Enes Talha Uçar  on 18.02.2024.
//

import SwiftUI

struct FirstPageView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundLayer()
                VStack {
                    Spacer()
                    Spacer()
                    Spacer()
                    Text("Serenade Tales")
                        .foregroundStyle(Color.white)
                        .font(.title)
                    Spacer()
                    Text("Çocuklarınızı huzurlu bir uykuya hazırlayın. Serenade Tales, her gece yeni bir masal sunar. Rüyalarınızın anahtarı burada!")
                        .frame(width: 320)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color.white)
                    Spacer()
                    NavigationLink("Masal Üret", destination: PromptView())
                        .padding()
                        .background(Color.green)
                        .cornerRadius(15)
                        .foregroundStyle(Color.white)
                        .padding(.bottom,20)
                    
                    NavigationLink(destination: SavedTalesView()) {
                        Text("Önceki masallara git ->")
                            .foregroundStyle(Color.white)
                    }
                    Spacer()
                }
                .padding()
            }.ignoresSafeArea(.all)
        }.tint(.white)
    }
}

#Preview {
    FirstPageView()
}

struct BackgroundLayer: View {
    var body: some View {
        Image("wallpaper")
            .resizable()
            .scaledToFill()
            .frame(width: UIScreen.main.bounds.width )
            .ignoresSafeArea(.all)
    }
}
