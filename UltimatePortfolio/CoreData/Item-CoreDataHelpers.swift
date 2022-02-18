//
//  Item-CoreDataHelpers.swift
//  UltimatePortfolio
//
//  Created by Jesús Solé on 18/2/22.
//

import Foundation

extension Item {
    var itemTitle: String {
        self.title ?? ""
    }
    
    var itemDetail: String {
        self.detail ?? ""
    }
    
    var itemCreationDate: Date {
        self.creationDate ?? Date()
    }
    
    static var example: Item {
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext
        
        let item = Item(context: viewContext)
        item.title = "Example Item"
        item.detail = "This is an example item"
        item.priority = 3
        item.creationDate = Date()
        
        return item
    }
}
