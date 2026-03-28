//
//  ServiceViewModel.swift
//  ZuperAssesment
//
//  Created by APPLE on 19/12/25.
//

import Foundation
import Combine

class ServiceViewModel: ObservableObject {
    
    @Published var searchText: String = ""
    @Published private(set) var services: [Service] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        services = ServiceDummyData.services
        setupSearch()
    }
    
    var filteredServices: [Service] {
        guard !searchText.isEmpty else { return services }
        return services.filter {
            $0.title.lowercased().contains(searchText.lowercased()) ||
            $0.customer.lowercased().contains(searchText.lowercased())
        }
    }
    
    private func setupSearch() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .sink { _ in }
            .store(in: &cancellables)
    }
}
