//
//  Project-CoreDataHelpers.swift
//  UltimatePortfolio
//
//  Created by Jesús Solé on 18/2/22.
//

import Foundation

extension Project {
    var projectTitle: String {
        self.title ?? ""
    }
    
    var projectDetail: String {
        self.detail ?? ""
    }
    
    var projectColor: String {
        self.color ?? "Light Blue"
    }
    
    var projectCreationDate: Date {
        self.creationDate ?? Date()
    }
    
    var projectItems: [Item] {
        let itemsArray = self.items?.allObjects as? [Item] ?? []
        
        return itemsArray.sorted { first, second in
            if first.completed == false {
                if second.completed == true {
                    return true
                }
            } else if first.completed == true {
                if second.completed == false {
                    return false
                }
            }

            if first.priority > second.priority {
                return true
            } else if first.priority < second.priority {
                return false
            }

            return first.itemCreationDate < second.itemCreationDate
        }
    }
    
    var completionAmount: Double {
        let originalItems = self.items?.allObjects as? [Item] ?? []
        guard originalItems.isEmpty == false else { return 0 }
        
        let completedItems = originalItems.filter(\.completed)
        return Double(completedItems.count) / Double(originalItems.count)
    }
    
    static var example: Project {
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext
        
        let project = Project(context: viewContext)
        project.title = "Example Project"
        project.detail = "This is an example Project"
        project.closed = true
        project.creationDate = Date()
        
        return project
    }
}
