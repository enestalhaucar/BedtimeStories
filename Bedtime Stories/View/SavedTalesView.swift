//
//  SavedTalesView.swift
//  Bedtime Stories
//
//  Created by Enes Talha Uçar  on 22.02.2024.
//

import SwiftUI

struct SavedTalesView: View {
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        
    }
    @StateObject var vm = ViewModel()
    
    var dateFormatter : DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm / dd MMMM"
        return formatter
    }
    @State private var service = Service()
    @Environment(\.presentationMode) var presentionMode
    @State var willTitle = ""
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundLayer()
                
                VStack() {
                    ScrollView {
                        ForEach(vm.savedTales, id: \.self) { tale in
                            NavigationLink(value: tale) {
                                HStack {
                                    Text("\(tale.title!)")
                                    Spacer()
                                    Text(dateFormatter.string(from: tale.date!))
                                }.frame(height: 55)
                                    .padding(.horizontal)
                                    .background(.ultraThinMaterial)
                                    .foregroundStyle(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                    .padding(.horizontal)
                                    .padding(.vertical, 5)
                            }
                            .contextMenu {
                                Button("Delete") {
                                    vm.deleteTale2(tale: tale)
                                }
                            }
                            
                        }.padding(.top,25)
                        
                        
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
                }.navigationDestination(for: TalesEntity.self) { tale in
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
                                    .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width / 8 , height: UIScreen.main.bounds.height - UIScreen.main.bounds.height / 4)
                                    .clipShape(RoundedRectangle(cornerRadius: 25))
                                
                                ScrollView {
                                    VStack {
                                        Text(tale.title ?? "")
                                            .font(.title3)
                                            .fontWeight(.bold)
                                            .multilineTextAlignment(.center)
                                            .foregroundStyle(.white)
                                            .padding(.top,15)
                                        Spacer()
                                        Text(tale.tale ?? "Story is not be saved")
                                            .font(.title3)
                                            .multilineTextAlignment(.center)
                                            .foregroundStyle(.white)
                                    }
                                }.frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width / 5 , height: UIScreen.main.bounds.height - UIScreen.main.bounds.height / 4)
                            }
                            
                            HStack {
                                TextField("", text: $willTitle, prompt: Text("Change Title").foregroundStyle(.white))
                                    .padding(.leading)
                                Button {
                                    tale.title = willTitle
                                    willTitle = ""
                                } label: {
                                    Image(systemName: "plus.circle")
                                        .padding(.trailing)
                                }

                            }.frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width / 8, height: 55)
                                .background(.ultraThinMaterial)
                                .foregroundStyle(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                            
                            
                        }
                    }
                    
                }
            }
        }.navigationTitle("Saved Tales")
            .navigationBarTitleDisplayMode(.inline)
        
    }
}




#Preview {
    SavedTalesView()
}


struct StoryViewPage2 : View {
    
    @StateObject var vm = ViewModel()
    @State private var service = Service()
    @State private var title : String = ""
    
    @Environment(\.presentationMode) var presentionMode
    @State private var showSavedStory : Bool = false
    var body: some View {
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
                        .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width / 8 , height: UIScreen.main.bounds.height - UIScreen.main.bounds.height / 4)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .padding(.top,40)
                    ScrollView {
                        HStack {
                            //                            Text(value?.title ?? "")
                            //                                .font(.title3)
                            //                                .multilineTextAlignment(.center)
                            //                                .foregroundStyle(.white)
                            //                                .padding(.top,60)
                            //                            Text(value?.tale ?? "")
                            //                                .font(.title3)
                            //                                .multilineTextAlignment(.center)
                            //                                .foregroundStyle(.white)
                        }
                    }.frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width / 5 , height: UIScreen.main.bounds.height - UIScreen.main.bounds.height / 5)
                }
                
                
                HStack {
                    Button(action: {
                        presentionMode.wrappedValue.dismiss()
                    }, label: {
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
                    })
                    Button(action: {
                        vm.addTales(title: "Story", tale: service.AIResponse, date: Date())
                        showSavedStory.toggle()
                    }, label: {
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
                    .fullScreenCover(isPresented: $showSavedStory, content: {
                        SavedTalesView()
                    })
                }.frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width / 8)
                
            }
        }.ignoresSafeArea()
    }
}
