//
//  SavedTalesView.swift
//  Bedtime Stories
//
//  Created by Enes Talha Uçar  on 22.02.2024.
//

import SwiftUI

struct SavedTalesView: View {
    @StateObject var vm = ViewModel()
    var dateFormatter : DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm / dd MMMM"
        return formatter
    }
    @Environment(\.presentationMode) var presentionMode
    var body: some View {
        NavigationStack {
            ZStack {
                Image("wallpaper")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .ignoresSafeArea()
                
                VStack {
                      ScrollView {
                        ForEach(vm.savedTales) { tale in
                            HStack {
                                Text("\(tale.title!)")
                                Spacer()
                                Text(dateFormatter.string(from: tale.date!))
                                    
                            }.frame(height: 55)
                                .padding(.horizontal)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .padding(.horizontal)
                                .padding(.vertical, 5)       
                        }
                    }
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
                }
            }
        }
    }
}

#Preview {
    SavedTalesView()
}
