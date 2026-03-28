//
//  ServiceListView.swift
//  ZuperAssesment
//
//  Created by APPLE on 19/12/25.
//

import SwiftUI

struct ServiceListView: View {
    @StateObject private var viewModel = ServiceViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Divider()
                List {
                    ForEach(viewModel.filteredServices) { filterService in
                        NavigationLink{
                            ServiceDetails(service: filterService)
                        } label: {
                            ServiceListRowView(service: filterService)
                        }
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                        .listRowBackground(Color.white)
                    }
                }
                .listStyle(.plain)
                .background(Color(.systemGroupedBackground))
                .navigationTitle("Services")
                .navigationBarTitleDisplayMode(.inline)
                .searchable(text: $viewModel.searchText,
                            placement: .navigationBarDrawer(displayMode: .always),
                            prompt: "Search"
                )
            }
        }
    }
}

#Preview {
    ServiceListView()
}
