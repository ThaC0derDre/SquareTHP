//
//  EmployeeDownloader.swift
//  SquareTHP
//
//  Created by Andres Gutierrez on 11/5/22.
//

import Foundation
import Combine

class EmployeeDownloader {
    
    static let instance = EmployeeDownloader()
    
    @Published var employeeArray = [Employee]()
    private var urlString = "https://s3.amazonaws.com/sq-mobile-interview/employees.json"
    private var badString = "https://s3.amazonaws.com/sq-mobile-interview/employees_malformed.json"
    
    var cancellables = Set<AnyCancellable>()
    
    private init() {
    downloadEmployees()
    }
    
    
    func downloadEmployees() {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: Staff.self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                case .finished :
                    break
                case.failure(let error):
                    
                    print("Error downloading data \(error)")
                }
            } receiveValue: { [weak self] returnedStaff in
                self?.employeeArray = returnedStaff.employees
            }
            .store(in: &cancellables)
    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse) // bad data alert
        }
        return output.data
    }
    
}
