//
//  IcaoTypeView.swift
//  Concourse
//
//  Created by Madison L.H. Wass on 9/19/24.
//  Copyright © 2024 Holding Pattern Industries. All rights reserved.
//

import SwiftUI

struct IcaoTypeView: View {
    @Environment(\.openWindow) private var openWindow
    @ObservedObject var icaoData = IcaoData()
    @State var selection: IcaoType.ID? = UUID()
    
    @State private var searchQuery: String = ""
    @State private var selectedScope: DesignatorSearchScope = .designator
    var filteredCodes: [IcaoType] {
        if searchQuery.isEmpty {
            return icaoData.codes.sorted(by: {($0.manufacturerCode, $0.modelFullName) < ($1.manufacturerCode, $1.modelFullName)})
        } else {
            switch selectedScope {
            case .designator:
                return icaoData.codes.sorted(by: {($0.manufacturerCode, $0.modelFullName) < ($1.manufacturerCode, $1.modelFullName)}).filter({ $0.designator.contains(searchQuery.uppercased()) })
            case .manufacturer:
                return icaoData.codes.sorted(by: {($0.manufacturerCode, $0.modelFullName) < ($1.manufacturerCode, $1.modelFullName)}).filter({ $0.manufacturerCode.contains(searchQuery.uppercased()) })
            case .model:
                return icaoData.codes.sorted(by: {($0.manufacturerCode, $0.modelFullName) < ($1.manufacturerCode, $1.modelFullName)}).filter({ $0.modelFullName.contains(searchQuery.uppercased()) })
            }
        }
    }
    
    var body: some View {
        Group {
            if icaoData.codes.isEmpty {
                VStack {
                    ProgressView()
                        .padding(.bottom)
                    Text("Loading...")
                        .font(.headline)
                }
            } else {
                Table(filteredCodes) {
                    TableColumn("Code") { dsg in
                        Text(dsg.designator)
                            .fontDesign(.monospaced)
                            .tracking(0.5)
                    }.width(70.0)
                    TableColumn("Manufacturer", value: \.manufacturerCode)
                    TableColumn("Model", value: \.modelFullName)
                    TableColumn("") { dsg in
                        Button(action: {
                            openWindow(value: dsg)
                        }, label: {
                            Label("Insert", systemImage: "plus")
                        })
                    }
                }
            }
        }
        .frame(minWidth: 1024.0, minHeight: 500.0)
        .searchable(text: $searchQuery)
        .searchScopes($selectedScope, scopes: {
            ForEach(DesignatorSearchScope.allCases, id: \.self) { dsg in
                Text(dsg.rawValue)
                    .tag(dsg)
            }
        })
        .task {
            do {
                try await icaoData.fetch()
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    IcaoTypeView()
}
