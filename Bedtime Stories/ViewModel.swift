//
//  ViewModel.swift
//  Bedtime Stories
//
//  Created by Enes Talha Uçar  on 22.02.2024.
//

import Foundation
import CoreData



class ViewModel : ObservableObject {
    let container : NSPersistentContainer
    @Published var savedTales : [TalesEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "TalesContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading Core Data, \(error.localizedDescription)")
            }
            else {
                print("Succesfully Core Data")
            }
            self.fetchTales()
        }
    }
    // MARK: FETCH DATA FROM TALES CONTAINER FUNCTION
    func fetchTales() {
        let request = NSFetchRequest<TalesEntity>(entityName: "TalesEntity")
        do {
            savedTales = try container.viewContext.fetch(request)
        } catch let error {
            print("Something wrong while fetching request, \(error.localizedDescription)")
        }
    }
    // MARK: ADD DATA TO TALES CONTAINER FUNCTION
    func addTales(title : String, tale : String, date: Date) {
        let newTale = TalesEntity(context: container.viewContext)
        newTale.id = UUID().uuidString
        newTale.title = title
        newTale.tale = tale
        newTale.date = date
        
        saveData()
    }
    // MARK: SAVING DATA
    func saveData() {
        do {
            try container.viewContext.save()
            fetchTales()
        } catch let error {
            print("Something wrong while saving data, \(error.localizedDescription)")
        }
    }
    
}
