////
////  CoreData.swift
////  Weather
////
////  Created by Sierra 4 on 16/02/17.
////  Copyright © 2017 codebrew. All rights reserved.
////
//import Foundation
//import CoreData
//import UIKit
//
//let appDelegate = UIApplication.shared.delegate as! AppDelegate
//let catEntity  = NSEntityDescription.entity(forEntityName: "WeatherData", in: appDelegate.persistentContainer.viewContext)!
//let category = NSManagedObject(entity: catEntity, insertInto: appDelegate.persistentContainer.viewContext)
//let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "WeatherData")
//
//class SaveData{
//    func saveData(distance: Array<Any>){
//        
//        for index in distance.indices
//        {
//            category.setValue(distance[index], forKeyPath: "distance")
//        }
//        do {
//            try appDelegate.persistentContainer.viewContext.save()
//        } catch let error as NSError {
//            print("Could not save. \(error), \(error.userInfo)")
//        }
//    }
//}
//
//class FetchData{
//    
//    func fetchData()
//    {
//        do {
//            let results = try appDelegate.persistentContainer.viewContext.fetch(fetchRequest)
//            
//            if (results.count > 0) {
//                for index in results.indices
//                {
//                    let person = results[index]
//                    
//                    if let first = person.value(forKey: "distance") {
//                        print("\(index+1) =  \(first)")
//                    }
//                }
//                
//            }
//        } catch let error as NSError {
//            print("Could not fetch. \(error), \(error.userInfo)")
//        }
//    }
//}
