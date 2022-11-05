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
            VStack {
                ScrollView {
                    ForEach(vm.employees) { employee in
                        HStack {
                            EmployeeCells(selectedEmployee: $selectedEmployee, employee: employee)
                        }
                    }
                }
                .refreshable { }
            }
            .padding()
            .navigationTitle("Employees")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
