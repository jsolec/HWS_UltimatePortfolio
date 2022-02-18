//
//  UltimatePortfolioApp.swift
//  UltimatePortfolio
//
//  Created by Jesús Solé on 16/2/22.
//

import SwiftUI

@main
struct UltimatePortfolioApp: App {
    @StateObject var dataController: DataController
    
    init() {
        let dataController = DataController()
        _dataController = StateObject(wrappedValue: dataController)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, self.dataController.container.viewContext)
                .environmentObject(self.dataController)
        }
    }
}
