//
//  EmployeeListView.swift
//  SquareTHP
//
//  Created by Andres Gutierrez on 11/5/22.
//

import SwiftUI

struct EmployeeListView: View {
    @StateObject var vm = EmployeeListViewModel()
    @State var selectedEmployee: Employee? = nil
    
    var body: some View {
        NavigationView {
            if vm.employees.isEmpty {
                emptyState
            }else {
                employeeList
            }
        }
        .refreshable { vm.dataService.downloadEmployees() }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeListView()
    }
}

extension EmployeeListView {
    private var employeeList: some View {
        ScrollViewReader { proxy in
            List(vm.employees) { employee in
                EmployeeCells(selectedEmployee: $selectedEmployee, employee: employee)
            }
            
        }
        .navigationTitle("Employees")
    }
    
    
    private var emptyState: some View {
            EmptyPageView()
                .frame(width: 300, height: 300, alignment: .center)
                .alert("Oh no..", isPresented: $vm.showAlert, actions: {}, message: {
                    Text(vm.errorMessage?.rawValue ?? "An Error has occured. Please try again")
                })
                .navigationTitle("← No Employees")
    }
}
