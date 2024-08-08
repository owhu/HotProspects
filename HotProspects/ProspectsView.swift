//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Oliver Hu on 8/8/24.
//

import SwiftUI
import SwiftData

struct ProspectsView: View {
    
    enum FilterType {
        case none, contacted, uncontacted
    }
    
    let filter: FilterType
    
    var title: String {
        switch filter {
        case .none:
            "Everyone"
        case .contacted:
            "Contacted people"
        case .uncontacted:
            "Uncontacted people"
        }
    }
    
    @Query(sort: \Prospect.name) var prospects: [Prospect]
    @Environment(\.modelContext) var modelContext
    
    
    var body: some View {
        List(prospects) { prospect in
            VStack(alignment: .leading) {
                Text(prospect.name)
                    .font(.headline)
                Text(prospect.emailAddress)
                    .foregroundStyle(.secondary)
            }
        }
    }
    
    init(filter: FilterType) {
        self.filter = filter

        if filter != .none {
            let showContactedOnly = filter == .contacted

            _prospects = Query(filter: #Predicate {
                $0.isContacted == showContactedOnly
            }, sort: [SortDescriptor(\Prospect.name)])
        }
    }
}

#Preview {
    ProspectsView(filter: .none)
}
