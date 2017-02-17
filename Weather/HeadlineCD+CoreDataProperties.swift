//
//  HeadlineCD+CoreDataProperties.swift
//  
//
//  Created by Sierra 4 on 17/02/17.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension HeadlineCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HeadlineCD> {
        return NSFetchRequest<HeadlineCD>(entityName: "HeadlineCD");
    }

    @NSManaged public var effectiveDate: String?
    @NSManaged public var effectiveEpochDate: Int16
    @NSManaged public var severity: Int16
    @NSManaged public var text: String?
    @NSManaged public var category: String?
    @NSManaged public var endDate: String?
    @NSManaged public var endEpochDate: Int16
    @NSManaged public var mobileLink: String?
    @NSManaged public var link: String?

}
