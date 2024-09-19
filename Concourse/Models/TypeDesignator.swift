//
//  TypeDesignator.swift
//  Concourse
//
//  Created by Madison L.H. Wass on 9/18/24.
//  Copyright © 2024 Holding Pattern Industries. All rights reserved.
//

import SwiftData
import SwiftUI

@Model
final class TypeDesignator {
    var code: String
    var manufacturer: String
    var model: String
    
    @Transient var fullModelString: String {
        "\(manufacturer) \(model)"
    }
    
    init(code: String, manufacturer: String, model: String) {
        self.code = code
        self.manufacturer = manufacturer
        self.model = model
    }
    
    @MainActor static func makeSampleData(in container: ModelContainer) {
        let samples: [TypeDesignator] = [
            TypeDesignator(code: "A124", manufacturer: "Antonov", model: "An-124-100"),
            TypeDesignator(code: "A21N", manufacturer: "Airbus", model: "A321neo"),
            TypeDesignator(code: "B744", manufacturer: "Boeing", model: "747-400"),
            TypeDesignator(code: "E295", manufacturer: "Embraer", model: "195 E2"),
            TypeDesignator(code: "MD11", manufacturer: "McDonnell Douglas", model: "MD-11")
        ]
        
        for sample in samples {
            container.mainContext.insert(sample)
        }
    }
}

struct TypeDesignatorSampleData: PreviewModifier {
    static func makeSharedContext() throws -> ModelContainer {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: TypeDesignator.self, configurations: config)
        TypeDesignator.makeSampleData(in: container)
        return container
    }
    
    func body(content: Content, context: ModelContainer) -> some View {
        content.modelContainer(context)
    }
}
