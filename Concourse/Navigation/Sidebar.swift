//
//  Sidebar.swift
//  Concourse
//
//  Created by Madison L.H. Wass on 9/18/24.
//  Copyright © 2024 Holding Pattern Industries. All rights reserved.
//
//  Based on the Apple sample app "Backyard Birds"
//  https://github.com/apple/sample-backyard-birds/
//

import SwiftUI

struct Sidebar: View {
    @Binding var selection: AppScreen?
    
    var body: some View {
        List(AppScreen.allCases, selection: $selection) { screen in
            NavigationLink(value: screen, label: {
                screen.label
            })
        }
        .navigationTitle("Bridgeway")
    }
}

#Preview {
    NavigationSplitView(sidebar: {
        Sidebar(selection: .constant(.aircraft))
    }, detail: {
        
    })
}
