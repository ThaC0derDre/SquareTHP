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
                    ForEach(vm.employees) { emp in
                        HStack {
                            Circle()
                                .frame(width: 75, height: 75)
                            VStack(alignment: .leading) {
                                Text(emp.name)
                                    .font(.headline)
                                Text(emp.team)
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
