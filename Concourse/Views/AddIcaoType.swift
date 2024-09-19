//
//  AddIcaoType.swift
//  Concourse
//
//  Created by Madison L.H. Wass on 9/19/24.
//  Copyright © 2024 Holding Pattern Industries. All rights reserved.
//

import SwiftData
import SwiftUI

struct AddIcaoType: View {
    @Environment(\.dismissWindow) private var dismissWindow
    @Environment(\.modelContext) private var modelContext
    @State var type: IcaoType
    
    @State private var designatorField: String = ""
    @State private var manufacturerField: String = ""
    @State private var modelField: String = ""
    
    private func clearFields() {
        designatorField = ""
        manufacturerField = ""
        modelField = ""
    }
    
    var body: some View {
        Form {
            TextField("Designator", text: $designatorField, prompt: Text("Type Designator"))
            TextField("Manufacturer", text: $manufacturerField, prompt: Text("Manufacturer"))
            TextField("Model", text: $modelField, prompt: Text("Model"))
        }
        .frame(width: 550.0)
        .padding()
        .navigationTitle("Add ICAO 8643 Type to Database")
        .task {
            designatorField = type.designator
            manufacturerField = type.manufacturerCode
            modelField = type.modelFullName
        }
        .toolbar {
//            ToolbarItem(placement: .cancellationAction, content: {
//                Button(action: {
//                    clearFields()
//                    dismissWindow()
//                }, label: {
//                    Image(systemName: "xmark.circle")
//                })
//            })
            
            ToolbarItem(placement: .automatic, content: {
                Button(action: {
                    manufacturerField = manufacturerField.capitalized
                }, label: {
                    Text("Fix Manufacturer")
                })
                .keyboardShortcut("f", modifiers: .command)
            })
            
            ToolbarItem(placement: .confirmationAction, content: {
                Button(action: {
                    let newTypeDesignator = TypeDesignator(code: designatorField,
                                                           manufacturer: manufacturerField,
                                                           model: modelField)
                    modelContext.insert(newTypeDesignator)
                    clearFields()
                    dismissWindow()
                }, label: {
                    Image(systemName: "checkmark.circle")
                })
            })
        }
    }
}

#Preview {
    AddIcaoType(type: .init(modelFullName: "A321neo", description: "", wtc: "", wtg: "", designator: "A21N", manufacturerCode: "Airbus", showInPart3Only: false, aircraftDescription: "", engineCount: "", engineType: ""))
}
