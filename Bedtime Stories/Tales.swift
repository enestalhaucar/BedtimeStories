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

enum endOfStory:  String, CaseIterable, Identifiable {
    case happy
    case sad
    var id: String { self.rawValue }
}

enum storyType {
    case funny
    case adventurous
    case fantasy
    case realistic
}

struct Tales : Identifiable, Equatable {
    let id = UUID().uuidString
    var role : Role
    var name : String
    var storyLanguage : String
    var age : Int
    var gender : Gender
    var endOfStory : endOfStory
    var storyType : storyType
    var additionalCharachters : [String]
    var place : String
    var XMinuteReading : Int
}
