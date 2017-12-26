//
//  CoreDataHandler.swift
//  TestingCoreDataForDateToEvent
//
//  Created by Normand Martin on 17-12-19.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import UIKit
import CoreData

class CoreDataHandler: NSObject {
    private class func getContext() ->  NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
// Saving data to CoreData
    class func saveObject(category: String, date: String, eventDescription: String, quizName: String, isFinished: Bool, isStarted: Bool) -> Bool{
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Event", in: context)
        let managedObject = NSManagedObject(entity: entity!, insertInto: context)
        

        managedObject.setValue(date, forKey: "date")
        managedObject.setValue(eventDescription, forKey: "eventDescription")
        managedObject.setValue(isFinished, forKey: "isFinished")

        
        
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
// Filtering Data
    class func filterData(searchFor: String, inAttribute: String) -> [Event]? {
        let context = getContext()
        let fetchRequest: NSFetchRequest<Event> = Event.fetchRequest()
        var event: [Event]? = nil
        let predicate = NSPredicate(format: "\(inAttribute) contains[c]%@", searchFor)

        fetchRequest.predicate = predicate
        
        do {
            try event = context.fetch(fetchRequest)
            return event
        }catch{
            return event

        }
        
    }

}
