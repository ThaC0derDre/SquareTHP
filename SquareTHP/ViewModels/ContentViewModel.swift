//
//  ContentViewModel.swift
//  SquareTHP
//
//  Created by Andres Gutierrez on 11/5/22.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {
    
    @Published var employees = [Employee]()
    @Published var showAlert = false
    @Published var errorMessage: ErrorMessage?
    
    let dataService = EmployeeDownloader.instance
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubcribers()
    }
    
    func addSubcribers() {
        dataService.$employeeArray
            .sink { [weak self] returnedEmployees in
                self?.employees = returnedEmployees.sorted()
            }
            .store(in: &cancellables)
        
        dataService.$showAlert
            .sink { [weak self] returnedBool in
                self?.showAlert = returnedBool
            }
            .store(in: &cancellables)
        
        dataService.$errorMessage
            .sink { [weak self] returnedMessage in
                self?.errorMessage = returnedMessage
            }
            .store(in: &cancellables)
    }
}
