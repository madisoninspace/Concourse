//
//  ConcourseApp.swift
//  Concourse
//
//  Created by Madison L.H. Wass on 9/18/24.
//  Copyright © 2024 Holding Pattern Industries. All rights reserved.
//

import SwiftData
import SwiftUI

@main
struct ConcourseApp: App {
    @Environment(\.openWindow) private var openWindow
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
//            Aircraft.self,
//            Airline.self,
//            Airport.self,
            TypeDesignator.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            CommandMenu("Data") {
                Button(action: {
                    openWindow(id: "icao8643")
                }, label: {
                    Label("ICAO 8643", systemImage: "i.square")
                })
                .keyboardShortcut("i", modifiers: [.command, .shift])
            }
        }
        .modelContainer(sharedModelContainer)
        
        // MARK: ICAO 8643 Windows
        Window("ICAO 8643 Type Designators", id: "icao8643") {
            IcaoTypeView()
        }
        .commandsRemoved()
        
        WindowGroup(for: IcaoType.self) { $ict in
            if let ict {
                AddIcaoType(type: ict)
            }
        }
        .commandsRemoved()
        .modelContainer(sharedModelContainer)
        .windowResizability(.contentSize)
        
        // MARK: Type Designator Windows
        Window("New Type Designator", id: "ntd") {
            ContentUnavailableView("Type Designator Editor", systemImage: "d.square", description: Text("This page is not yet implemented."))
        }
        .commandsRemoved()
        .modelContainer(sharedModelContainer)
        
        WindowGroup(for: TypeDesignator.ID.self) { $id in
            let context = ModelContext(sharedModelContainer)
            if let id, let dsg = context.model(for: id) as? TypeDesignator {
                ContentUnavailableView("Type Designator Editor", systemImage: "d.square", description: Text("This page is not yet implemented."))
            }
        }
        .commandsRemoved()
        .modelContainer(sharedModelContainer)
    }
}
