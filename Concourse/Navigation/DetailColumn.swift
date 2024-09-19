//
//  DetailColumn.swift
//  Concourse
//
//  Created by Madison L.H. Wass on 9/18/24.
//  Copyright © 2024 Holding Pattern Industries. All rights reserved.
//
//  Based on the Apple sample app "Backyard Birds"
//  https://github.com/apple/sample-backyard-birds/
//

import SwiftData
import SwiftUI

struct DetailColumn: View {
    var screen: AppScreen?
    
    var body: some View {
        Group {
            if let screen {
                screen.destination
            } else {
                ContentUnavailableView("How'd you get here?", systemImage: "exclamationmark.triangle",
                                       description: Text("Welcome to the backrooms I guess."))
            }
        }
    }
}

#Preview {
    DetailColumn()
}
