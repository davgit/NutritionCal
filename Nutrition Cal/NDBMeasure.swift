//
//  NDBMeasure.swift
//  Nutrition Cal
//
//  Created by Omar Albeik on 11/26/15.
//  Copyright © 2015 Omar Albeik. All rights reserved.
//

import Foundation
import CoreData


class NDBMeasure: NSManagedObject {
	
	@NSManaged var label: String?
	@NSManaged var eqv: NSNumber?
	@NSManaged var qty: NSNumber?
	@NSManaged var value: NSNumber?
	@NSManaged var nutrient: NDBNutrient
	
	override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
		super.init(entity: entity, insertIntoManagedObjectContext: context)
	}
	
	init(nutrient: NDBNutrient, dictionary: [String: AnyObject], context: NSManagedObjectContext) {
		
		let entity = NSEntityDescription.entityForName("NDBMeasure", inManagedObjectContext: context)!
		super.init(entity: entity, insertIntoManagedObjectContext: context)
		
		self.label = (dictionary["label"] as! String)
		
		if let eqvNumber = dictionary["eqv"] as? Int {
			self.eqv = eqvNumber
		} else {
			self.eqv = 0
		}
		
		self.qty = (dictionary["qty"] as! Int)
		self.value = (dictionary["value"] as! Double)
		self.nutrient = nutrient
	}
}
