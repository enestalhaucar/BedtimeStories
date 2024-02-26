//
//  Tales.swift
//  Bedtime Stories
//
//  Created by Enes Talha Uçar  on 19.02.2024.
//

import Foundation

enum Gender: String, CaseIterable, Identifiable, Hashable {
    case male = "Male"
    case female = "Female"
    case diverse = "Diverse"
    
    var id: String { self.rawValue }
}

enum Role {
    case user
    case model
}

enum EndOfStory:  String, CaseIterable, Identifiable, Hashable{
    case happy = "Happy"
    case sad = "Sad"
    var id: String { self.rawValue }
}

enum StoryType: String, CaseIterable, Identifiable, Hashable{
    case funny = "Funny"
    case adventurous = "Adventurous"
    case fantasy = "Fantasy"
    case realistic = "Realistic"
    var id: String { self.rawValue }
    
}

struct Tales : Identifiable, Equatable {
    let id = UUID().uuidString
    var role : Role
    var name : String
    var storyLanguage : String
    var age : Int
    var gender : Gender
    var endOfStory : EndOfStory
    var storyType : StoryType
    var additionalCharachters : [String]
    var place : String
    var XMinuteReading : Int
}
