//
//  IcaoType.swift
//  Concourse
//
//  Created by Madison L.H. Wass on 9/18/24.
//  Copyright © 2024 Holding Pattern Industries. All rights reserved.
//

import Foundation

struct IcaoType: Codable, Hashable, Identifiable {
    var id = UUID()
    let modelFullName, description: String
    let wtc: String?
    let wtg: String?
    let designator, manufacturerCode: String
    let showInPart3Only: Bool
    let aircraftDescription: String?
    let engineCount: String
    let engineType: String?

    enum CodingKeys: String, CodingKey {
        case modelFullName = "ModelFullName"
        case description = "Description"
        case wtc = "WTC"
        case wtg = "WTG"
        case designator = "Designator"
        case manufacturerCode = "ManufacturerCode"
        case showInPart3Only = "ShowInPart3Only"
        case aircraftDescription = "AircraftDescription"
        case engineCount = "EngineCount"
        case engineType = "EngineType"
    }
}
