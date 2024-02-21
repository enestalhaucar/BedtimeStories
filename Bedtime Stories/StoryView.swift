//
//  StoryView.swift
//  Bedtime Stories
//
//  Created by Enes Talha Uçar  on 19.02.2024.
//

import SwiftUI

struct StoryView: View {
    @State private var service = Service()
    @State private var text = ""
    
    var body: some View {
        ZStack {
            Image("wallpaper")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .ignoresSafeArea()
            
            ZStack {
                Rectangle()
                    .background(.ultraThinMaterial)
                    .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width / 8 , height: UIScreen.main.bounds.height - UIScreen.main.bounds.height / 7)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                ScrollView {
                    Text("harikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharikaharika")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                    
                    
                    
                }.frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width / 5 , height: UIScreen.main.bounds.height - UIScreen.main.bounds.height / 5)
                    
                    
                    
                    
            }
        }
    }
}

#Preview {
    StoryView()
}
