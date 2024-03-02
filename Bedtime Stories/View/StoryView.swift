//
//  StoryView.swift
//  Bedtime Stories
//
//  Created by Enes Talha Uçar  on 19.02.2024.
//

import SwiftUI

struct StoryView: View {
    @StateObject var vm = ViewModel()
    @State private var service = Service()
    @State private var text = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("wallpaper")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .ignoresSafeArea()
                
                VStack {
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
                    
                    HStack {
                        NavigationLink(destination: PromptView()) {
                            HStack {
                                Text("New Tale")
                                Image(systemName: "plus.circle")
                            }.font(.headline)
                                .frame(maxWidth: .infinity)
                                .frame(height: 55)
                                .background(.ultraThinMaterial)
                                .foregroundStyle(Color.white)
                                .cornerRadius(25)
                                .padding()
                        }
                        Button(action: {}, label: {
                            HStack {
                                Text("Save")
                                Image(systemName: "square.and.arrow.down.on.square")
                            }.font(.headline)
                                .frame(maxWidth: .infinity)
                                .frame(height: 55)
                                .background(.ultraThinMaterial)
                                .foregroundStyle(Color.white)
                                .cornerRadius(25)
                                .padding()
                        })
                    }.frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width / 8)
                }
            }
        }
    }
}

#Preview {
    StoryView()
}
