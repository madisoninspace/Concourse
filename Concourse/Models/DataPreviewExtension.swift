//
//  DataPreviewExtension.swift
//  Concourse
//
//  Created by Madison L.H. Wass on 9/18/24.
//  Copyright © 2024 Holding Pattern Industries. All rights reserved.
//

import SwiftData
import SwiftUI

extension PreviewTrait where T == Preview.ViewTraits {
//    @MainActor static var sampleAircraftData: Self = .modifier(AircraftSampleData())
//    @MainActor static var sampleAirlineData: Self = .modifier(AirlineSampleData())
//    @MainActor static var sampleAirportData: Self = .modifier(AirportSampleData())
    @MainActor static var sampleDesignatorData: Self = .modifier(TypeDesignatorSampleData())
}
