//
//  SavedTalesView.swift
//  Bedtime Stories
//
//  Created by Enes Talha Uçar  on 22.02.2024.
//

import SwiftUI

struct SavedTalesView: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        ZStack {
            Image("wallpaper")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
            
            VStack {
                ForEach(vm.savedTales) { tale in
                    Text("Enes").frame(height: 55).frame(maxWidth: .infinity)
                        
                        
                }
            }
        }
    }
}

#Preview {
    SavedTalesView()
}
