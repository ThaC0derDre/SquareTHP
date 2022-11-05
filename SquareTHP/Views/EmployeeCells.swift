//
//  EmployeeCells.swift
//  SquareTHP
//
//  Created by Andres Gutierrez on 11/5/22.
//

import SwiftUI

struct EmployeeCells: View {
    
    
    @Namespace private var ProfileView
    @Binding var selectedEmployee: Employee?
    private var isSelected: Bool {
        employee.id == selectedEmployee?.id
    }
    
    let employee: Employee
    
    var body: some View {
        if isSelected {
            expandedView
        }
        collapsedView
    }
}

//struct EmployeeCells_Previews: PreviewProvider {
//    static var previews: some View {
//        EmployeeCells(selectedEmployee: _, employee: Employee.sampleEmployee)
//    }
//}

extension EmployeeCells {
    private var collapsedView: some View {
        HStack {
            ImageView(urlString: employee.photo ?? "n/a")
                .frame(width: 75, height: 75)
                .matchedGeometryEffect(id: "Image", in: ProfileView)
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
    
    private var expandedView: some View {
        VStack {
            ImageView(urlString: employee.photo ?? "n/a")
                .matchedGeometryEffect(id: "Image", in: ProfileView)
                .frame(width: 150, height: 150)
            Text(employee.name)
            Text(employee.team)
            VStack(alignment: .leading) {
                if let bio = employee.bio {
                    Text("BIO")
                        .foregroundColor(.primary.opacity(0.6))
                        .padding(.bottom, 2)
                    
                    Text(bio)
                        .padding(.bottom, 2)
                }
                
                Text("CONTACT")
                    .foregroundColor(.primary.opacity(0.6))
                    .padding(.bottom, 2)
                HStack{
                    Text("Email :")
                    Text(employee.email)
                }
                HStack {
                    if let number = employee.number {
                        Text("Phone Number:")
                        Text(number)
                    }
                }
            }
            .padding(.vertical)
        }
        
    }
}

