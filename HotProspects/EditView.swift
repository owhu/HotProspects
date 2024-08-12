//
//  EditView.swift
//  HotProspects
//
//  Created by Oliver Hu on 8/12/24.
//

import SwiftUI
import SwiftData

struct EditView: View {
    @Bindable var prospects: Prospect

    
    var body: some View {
        Form {
            TextField("Name", text: $prospects.name)
            TextField("Email", text: $prospects.emailAddress)
            Toggle("Contacted", isOn: $prospects.isContacted)
        }
        .navigationTitle("Edit Prospect")
        .navigationBarTitleDisplayMode(.inline)
    }
    

}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Prospect.self, configurations: config)
        let example = Prospect(name: "Example User", emailAddress: "example@user.com", isContacted: false)

        return EditView(prospects: example)
            .modelContainer(container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
