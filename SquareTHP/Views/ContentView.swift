//
//  ContentView.swift
//  SquareTHP
//
//  Created by Andres Gutierrez on 11/5/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ContentViewModel()
    @State var selectedEmployee: Employee? = nil
    
    var body: some View {
        NavigationView {
            List(vm.employees) { employee in
                    EmployeeCells(selectedEmployee: $selectedEmployee, employee: employee)
            }
            .navigationTitle("Employees")
        }
        .refreshable { }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
