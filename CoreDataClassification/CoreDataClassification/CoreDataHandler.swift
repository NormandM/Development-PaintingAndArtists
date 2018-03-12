//
//  CoreDataHandler.swift
//  CoreDataClassification
//
//  Created by Normand Martin on 18-02-07.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import UIKit
import CoreData

class CodeDataHandler: NSObject {
    private class func getContext() ->  NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    // Saving data to CoreData
    class func saveObject(day: String, month: String, eventDescription: String, typeOfEvent: String, year: String) -> Bool  {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Event", in: context)
        let managedObject = NSManagedObject(entity: entity!, insertInto: context)
        managedObject.setValue(day, forKey: "day")
        managedObject.setValue(month, forKey: "month")
        managedObject.setValue(eventDescription, forKey: "eventDescription")
        managedObject.setValue(typeOfEvent, forKey: "typeOfEvent")
        managedObject.setValue(year, forKey: "year")

        
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
        let predicate1 = NSPredicate(format: "\(inAttribute) contains[c]%@", searchFor)
        //let predicate2 = NSPredicate(format: "year == %@ OR year == %@ OR year == %@ OR year == %@ OR year == %@ OR year == %@ OR year == %@ OR year == %@ OR year == %@", "1775", "1776", "1777", "1778", "1779", "1780", "1781", "1782", "1783")
        let predicate3 = NSPredicate(format: "typeOfEvent == %@", "Events")
        //let predicate4 = NSPredicate(format: "eventDescription contains[c]%@", "America")
        //let predicate5 = NSPredicate(format: "(eventDescription contains[c]%@)", "exploration")
        let predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [predicate1, predicate3])
        fetchRequest.predicate = predicate
        
        do {
            try event = context.fetch(fetchRequest)
            return event
        }catch{
            return event
            
        }
        
    }
}



