//
//  PromptView.swift
//  Bedtime Stories
//
//  Created by Enes Talha Uçar  on 18.02.2024.
//
import Foundation
import SwiftUI
import GoogleGenerativeAI



struct PromptView: View {
    @StateObject var vm = ViewModel()
    @State private var service = Service()
    @State private var name = ""
    @State private var language = ""
    @State private var value : Double = 0.5
    @State private var selectedGender : Gender = .female
    @State private var endOfStory = ""
    @State private var storyType = ""
    @State private var place = ""
    @State private var XMinuteReading = ""
    @State var showStorySheet : Bool = false
    
    
    @State var textInput = ""
    
    
    
    var body: some View {
        
        ZStack {
            Image("wallpaper")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
            
            VStack {
                
                ScrollView {
                    // MARK: NAME AND LANGUAGE TF
                    HStack {
                        // Name TextField
                        TextField("", text: $name, prompt: Text("Name").foregroundStyle(.black.opacity(0.6)))
                            .padding()
                            .foregroundStyle(Color.black)
                            .background(Color.yellow)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.horizontal)
                        // Language TextField
                        TextField("", text: $language, prompt: Text("Language").foregroundStyle(.black.opacity(0.6)))
                            .padding()
                            .foregroundStyle(Color.black)
                            .background(Color.yellow)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding()
                            
                        
                        
                    }.padding(.top,50)
                    
                    // MARK: CHILDREN AGE SLIDER
                    VStack {
                        Text("Child's Age: \(Int(value * 12))")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                            .padding(.horizontal)
                            .foregroundColor(.yellow)
                            .fontWeight(.heavy)
                        
                        // Slider
                        GeometryReader { geometry in
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 2.5)
                                    .frame(width: geometry.size.width, height: 5)
                                    .foregroundStyle(.yellow)
                                ZStack {
                                    Circle()
                                        .stroke(lineWidth: 4)
                                        .foregroundStyle(.black)
                                    Circle()
                                        .foregroundColor(.yellow)
                                    
                                    
                                }
                                .offset(x: CGFloat(value) * geometry.size.width - 20)
                                .gesture(
                                    DragGesture(minimumDistance: 0)
                                        .onChanged { gesture in
                                            updateValue(with: gesture, in: geometry)
                                        }
                                )
                            }
                            
                        }.padding(.horizontal)
                            .frame(height: 20)
                    }
                    .padding(.bottom, 20)
                    
                    // MARK: GENDER PICKER
                    Picker(selection: $selectedGender) {
                        ForEach(Gender.allCases) { gender in
                            Text(gender.rawValue)
                                .tag(gender)
                        }
                        
                        
                    } label: {
                        
                    }.pickerStyle(SegmentedPickerStyle())
                        .background(Color.yellow)
                        .padding(.horizontal)
                        .padding(.bottom,20)
                    
                    
                    
                    // STORYEND
                    TextField("", text: $endOfStory, prompt: Text("How will the story end?").foregroundStyle(.black.opacity(0.6)))
                        .padding()
                        .foregroundStyle(Color.black)
                        .background(Color.yellow)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding()
                    // STORYTYPE
                    TextField("", text: $storyType, prompt: Text("What type of story should it be ?").foregroundStyle(.black.opacity(0.6)))
                        .padding()
                        .foregroundStyle(Color.black)
                        .background(Color.yellow)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding()
                    // STORYPLACE
                    TextField("", text: $place, prompt: Text("Where should the story take place?").foregroundStyle(.black.opacity(0.6)))
                        .padding()
                        .foregroundStyle(Color.black)
                        .background(Color.yellow)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding()
                    //STORYMIN
                    TextField("", text: $XMinuteReading, prompt: Text("How many minutes should the story take to read?")
                        .foregroundStyle(.black.opacity(0.6))
                        .font(.system(size: 14.5))
                    )
                    .padding()
                    .foregroundStyle(Color.black)
                    .background(Color.yellow)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                }
                
                
                
                
                
                
                Spacer()
                
                // MARK: FETCH BUTTON
                HStack {
                    if service.loadingResponse == false {
                        Button(action: sendMessage, label: {
                            Text("Create a story")
                            Image(systemName: "paperplane")
                        }).padding()
                            .background(Color.yellow)
                            .cornerRadius(10)
                            .foregroundStyle(.black)
                            .fullScreenCover(isPresented: $service.showStorySheet, content: {
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
                                                Text(service.AIResponse)
                                                    .font(.title3)
                                                    .multilineTextAlignment(.center)
                                                    .foregroundStyle(.white)
                                            }.frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width / 5 , height: UIScreen.main.bounds.height - UIScreen.main.bounds.height / 5)
                                         }
                                        
                                        Button(action: {
                                            vm.addTales(title: "Talha Ucar", tale: service.AIResponse, date: Date())
                                        }, label: {
                                            HStack {
                                                Text("Save")
                                                Image(systemName: "square.and.arrow.down.on.square")
                                            }.font(.headline)
                                                .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width / 8 , height: 55)
                                                .background(.ultraThinMaterial)
                                                .foregroundStyle(Color.white)
                                                .cornerRadius(25)
                                                .padding()
                                            
                                        })
                                    }
                                }.ignoresSafeArea()
                            })
                    }  else {
                        ProgressView()
                            .tint(.white)
                    }
                }
                
                
                
                Spacer()
                
                
                
            }
            
            
        }
        
        
    }
    
    private func sendMessage() {
        Task {
            textInput = "Hello, I want you to create a story to help children fall asleep. The age of the child for whom you will create a story is \(value). The main character of the story should be the same age as the child. The gender of the child for whom you will create a story is a \(selectedGender). Choose the main character in the story according to the gender of the child. The name of the main character of the story will be the same as the child's name. The child's name is \(name). The story will have a \(endOfStory) ending. Let the story be \(XMinuteReading) minutes long, suitable for reading. The style of the story will be \(storyType). The language of the story will be \(language)."
            service.fetchResponse(input: textInput)
            textInput = ""
            name = ""
            language = ""
            value = 0.5
            selectedGender = .female
            endOfStory = ""
            storyType = ""
            place = ""
            XMinuteReading = ""
            
        }
    }
    
    private func updateValue(with gesture: DragGesture.Value, in geometry: GeometryProxy) {
        let newValue = gesture.location.x / geometry.size.width
        value = min(max(Double(newValue),0),1)
    }
    
    
}

#Preview {
    PromptView()
}
