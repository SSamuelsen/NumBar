//
//  Forms+CoreDataProperties.swift
//  MACtoText_V.2
//
//  Created by Stephen Samuelsen on 7/22/18.
//  Copyright © 2018 Stephen Samuelsen. All rights reserved.
//
//

import Foundation
import CoreData


extension Forms {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Forms> {
        return NSFetchRequest<Forms>(entityName: "Forms")
    }

    @NSManaged public var department: String?
    @NSManaged public var pcName: String?

}
