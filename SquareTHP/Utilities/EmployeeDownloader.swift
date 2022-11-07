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
    @Published var showAlert     = false
    @Published var errorMessage: ErrorMessage?
    // DIFFERENT URL STRINGS HERE ↓
    private var goodUrl  = "https://s3.amazonaws.com/sq-mobile-interview/employees.json"
    private var badUrl   = "https://s3.amazonaws.com/sq-mobile-interview/employees_malformed.json"
    private var emptyUrl = "https://s3.amazonaws.com/sq-mobile-interview/employees_empty.json"
    
    var cancellables     = Set<AnyCancellable>()
    
    private init() {
        downloadEmployees()
    }
    
    
    func downloadEmployees() {
        //      CHANGE URL STRING HERE ↓
        guard let url = URL(string: goodUrl) else {
            showAlert    = true
            errorMessage = .invaildURL
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: Staff.self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                case .finished :
                    break
                case .failure(let error):
                    self.showAlert    = true
                    self.errorMessage = .invaildData
                    print("Error downloading data: \(error.localizedDescription)")
                }
            } receiveValue: { [weak self] returnedStaff in
                guard let self = self else { return }
                self.employeeArray = returnedStaff.employees
                if self.employeeArray.isEmpty  {
                    self.showAlert    = true
                    self.errorMessage = .emptyList
                }
            }
            .store(in: &cancellables)
    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            showAlert    = true
            errorMessage = .invalidResponse
            throw ErrorMessage.invalidResponse
        }
        return output.data
    }
    
}
