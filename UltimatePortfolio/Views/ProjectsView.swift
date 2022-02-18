//
//  ProjectsView.swift
//  UltimatePortfolio
//
//  Created by Jesús Solé on 17/2/22.
//

import SwiftUI

struct ProjectsView: View {
    let showClosedProjects: Bool
    let projects: FetchRequest<Project>
    
    init(showClosedProjects: Bool) {
        self.showClosedProjects = showClosedProjects
        self.projects = FetchRequest<Project>(
            entity: Project.entity(),
            sortDescriptors: [
                NSSortDescriptor(keyPath: \Project.creationDate, ascending: false)
            ],
            predicate: NSPredicate(format: "closed = %d", showClosedProjects)
        )
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.projects.wrappedValue) { project in
                    Section(header: Text(project.projectTitle)) {
                        ForEach(project.projectItems) { item in
                            Text(item.itemTitle)
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle(self.showClosedProjects ? "Closed Projects" : "Open Projects")
        }
    }
}

struct ProjectsView_Previews: PreviewProvider {
    static var dataController = DataController.preview
    static var previews: some View {
        ProjectsView(showClosedProjects: false)
            .environment(\.managedObjectContext, self.dataController.container.viewContext)
            .environmentObject(self.dataController)
    }
}
