//
//  ContentView.swift
//  SquareTHP
//
//  Created by Andres Gutierrez on 11/5/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ContentViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(vm.employees) { employee in
                        HStack {
                            Circle()
                                .frame(width: 75, height: 75)
                            VStack(alignment: .leading) {
                                Text(employee.name)
                                    .font(.headline)
                                Text(employee.team)
                                    .foregroundColor(.gray)
                                    .italic()
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                    }
                }
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
