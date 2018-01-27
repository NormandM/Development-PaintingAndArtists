//
//  CodeDataHandler.swift
//  HistoricDatesQuiz
//
//  Created by Normand Martin on 17-12-26.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import UIKit
import CoreData

class CodeDataHandler: NSObject {
    private class func getContext() ->  NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    // Saving data to CoreData
    class func saveObject(selectedTitle: String, date: String, eventDescription: String, isCompleted: Bool, numberCompleted: Int, quizNumber: String, typeOfEvent: String) -> Bool {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Event", in: context)
        let managedObject = NSManagedObject(entity: entity!, insertInto: context)
        managedObject.setValue(selectedTitle, forKey: "selectedTitle")
        managedObject.setValue(date, forKey: "date")
        managedObject.setValue(eventDescription, forKey: "eventDescription")
        managedObject.setValue(isCompleted, forKey: "isCompleted")
        managedObject.setValue(numberCompleted, forKey: "numberCompleted")
        managedObject.setValue(quizNumber, forKey: "quizNumber")
        managedObject.setValue(typeOfEvent, forKey: "typeOfEvent")
        do {
            try context.save()
            return true
        }catch{
            return false
        }
    }
    class func saveSingleObject(event: Event) -> Bool {
        let context = getContext()
        do {
            try context.save()
            return true
        }catch{
            return false
        }
    }
    // FetchRequest
    class func fetchObject() -> [Event]? {
        let context = getContext()
        var dateOfEvent: [Event]? = nil
        do {
            dateOfEvent = try context.fetch(Event.fetchRequest())
            return dateOfEvent
        }catch{
            return dateOfEvent
        }
        
    }
    // Delete a single object
    class func deleteObject(event: Event) -> Bool {
        let context = getContext()
        context.delete(event)
        
        do {
            try context.save()
            return true
        }catch{
            return false
        }
    }
    // Delete all objects
    class func cleanDelete () -> Bool {
        let context = getContext()
        let delete = NSBatchDeleteRequest(fetchRequest: Event.fetchRequest())
        
        do {
            try context.execute(delete)
            return true
        }catch{
            return false
        }
    }
    class func filterData(searchFor: String, inAttribute: String) -> [Event]? {
        let context = getContext()
        let fetchRequest: NSFetchRequest<Event> = Event.fetchRequest()
        var event: [Event]? = nil
        let predicate = NSPredicate(format: "\(inAttribute) == %@", searchFor)
        
        fetchRequest.predicate = predicate
        
        do {
            try event = context.fetch(fetchRequest)
            return event
        }catch{
            return event
            
        }
    }
    class func filterForCompleted(searchFor: Bool, inAttribute: String) -> [Event]? {
        let context = getContext()
        let fetchRequest: NSFetchRequest<Event> = Event.fetchRequest()
        var event: [Event]? = nil
        let predicate = NSPredicate(format: "\(inAttribute) == %@", NSNumber(value: true))
        fetchRequest.predicate = predicate
        do {
            try event = context.fetch(fetchRequest)
            return event
        }catch{
            return event
            
        }
    }
    class func filterForCompletedForSelectedTitle(searchForTitlte: String, serachForCompleted: Bool, inTitleAttribute: String, inCompletedAttribute: String) -> [Event]? {
        let context = getContext()
        let fetchRequest: NSFetchRequest<Event> = Event.fetchRequest()
        var event: [Event]? = nil
        let predicate1 = NSPredicate(format: "\(inTitleAttribute) == %@", searchForTitlte)
        let predicate2 = NSPredicate(format: "\(inCompletedAttribute) == %@", NSNumber(value: true))
        let predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [predicate1, predicate2])
        fetchRequest.predicate = predicate
        do {
            try event = context.fetch(fetchRequest)
            return event
        }catch{
            return event
            
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    

}
