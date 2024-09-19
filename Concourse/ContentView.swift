//
//  ContentView.swift
//  Concourse
//
//  Created by Madison L.H. Wass on 9/18/24.
//  Copyright © 2024 Holding Pattern Industries. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var screen: AppScreen? = .aircraft
    
    var body: some View {
        NavigationSplitView(sidebar: {
            Sidebar(selection: $screen)
                .frame(width: 225.0)
        }, detail: {
            DetailColumn(screen: screen)
        })
        .frame(minWidth: 1280.0, minHeight: 600.0)
    }
}

#Preview {
    ContentView()
}
