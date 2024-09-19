//
//  IcaoData.swift
//  Concourse
//
//  Created by Madison L.H. Wass on 9/18/24.
//  Copyright © 2024 Holding Pattern Industries. All rights reserved.
//

import Foundation
import SwiftUI

class IcaoData: ObservableObject {
    @Published var codes: [IcaoType] = []
    
    @MainActor
    func fetch() async throws {
        do {
            if let url = Bundle.main.url(forResource: "icao", withExtension: "json") {
                let data = try Data(contentsOf: url)
                let json = try JSONDecoder().decode([IcaoType].self, from: data)
                self.codes = json
            }
        }
    }
}
