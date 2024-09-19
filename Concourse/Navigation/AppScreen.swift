//
//  AppScreen.swift
//  Concourse
//
//  Created by Madison L.H. Wass on 9/18/24.
//  Copyright © 2024 Holding Pattern Industries. All rights reserved.
//
//  Based on the Apple sample app "Backyard Birds"
//  https://github.com/apple/sample-backyard-birds/
//

import SwiftUI

enum AppScreen: Codable, Hashable, Identifiable, CaseIterable {
    case aircraft
    case airlines
    case airports
    case typeDesignators
    
    var id: AppScreen { self }
}

extension AppScreen {
    var title: String {
        switch self {
        case .aircraft:
            return "Aircraft"
        case .airlines:
            return "Airlines"
        case .airports:
            return "Airports"
        case .typeDesignators:
            return "Type Designators"
        }
    }
    
    var icon: String {
        switch self {
        case .aircraft:
            return "airplane"
        case .airlines:
            return "airplane.departure"
        case .airports:
            return "airplane.arrival"
        case .typeDesignators:
            return "d.square"
        }
    }
    
    @ViewBuilder var label: some View {
        switch self {
        case .aircraft:
            Label("Aircraft", systemImage: "airplane")
        case .airlines:
            Label("Airlines", systemImage: "airplane.departure")
        case .airports:
            Label("Airports", systemImage: "airplane.arrival")
        case .typeDesignators:
            Label("Type Designators", systemImage: "d.square")
        }
    }
    
    @ViewBuilder var destination: some View {
        switch self {
        case .aircraft:
            ContentUnavailableView("Aircraft", systemImage: "airplane", description: Text("This page is not yet implemented."))
        case .airlines:
            ContentUnavailableView("Airlines", systemImage: "airplane.departure", description: Text("This page is not yet implemented."))
        case .airports:
            ContentUnavailableView("Airports", systemImage: "airplane.arrival", description: Text("This page is not yet implemented."))
        case .typeDesignators:
            ContentUnavailableView("Type Designators", systemImage: "d.square", description: Text("This page is not yet implemented."))
        }
    }
}
