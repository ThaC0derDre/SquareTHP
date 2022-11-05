//
//  EmployeeCells.swift
//  SquareTHP
//
//  Created by Andres Gutierrez on 11/5/22.
//

import SwiftUI

struct EmployeeCells: View {
    
    let employee: Employee
    
    var body: some View {
        HStack {
            ImageView(urlString: employee.photo)
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

struct EmployeeCells_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeCells(employee: Employee.sampleEmployee)
            .padding()
    }
}
