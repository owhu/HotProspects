//
//  ContentView.swift
//  HotProspects
//
//  Created by Oliver Hu on 8/6/24.
//

import SwiftUI
import UserNotifications
import SamplePackage

struct ContentView: View {
    @State private var sortOrder = [
        SortDescriptor(\Prospect.name),
        SortDescriptor(\Prospect.emailAddress),
    ]
   
    
    var body: some View {
        TabView {
            SortableProspectsView(filter: .none)
                .tabItem {
                    Label("Everyone", systemImage: "person.3")
                }
            SortableProspectsView(filter: .contacted)
                .tabItem {
                    Label("Contacted", systemImage: "checkmark.circle")
                }
            SortableProspectsView(filter: .uncontacted)
                .tabItem {
                    Label("Uncontacted", systemImage: "questionmark.diamond")
                }
            MeView()
                .tabItem {
                    Label("Me", systemImage: "person.crop.square")
                }
        }
    }
}

#Preview {
    ContentView()
}
