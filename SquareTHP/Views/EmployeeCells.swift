//
//  EmployeeCells.swift
//  SquareTHP
//
//  Created by Andres Gutierrez on 11/5/22.
//

import SwiftUI

struct EmployeeCells: View {
    
    
    @Namespace private var profileView
    @Binding var selectedEmployee: Employee?
    private var isSelected: Bool {
        employee.id == selectedEmployee?.id
    }
    let employee: Employee
    
    
    var body: some View {
        if isSelected {
            expandedView
        } else {
            collapsedView
        }
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
                .matchedGeometryEffect(id: "\(employee.id)'s image", in: profileView)
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
        .onTapGesture(perform: selectOrDeselect)
    }
    
    private var expandedView: some View {
        VStack {
            ImageView(urlString: employee.photo ?? "n/a")
                .matchedGeometryEffect(id: "\(employee.id)'s image", in: profileView)
                .frame(width: 150, height: 150)
            Text(employee.name)
                .fontWeight(.heavy)
            Text(employee.team)
                .foregroundColor(.gray)
                .italic()
            
            VStack(alignment: .leading) {
                if let bio = employee.bio {
                    Text("BIO")
                        .fontWeight(.light)
                        .padding(.bottom, 2)
                    
                    Text(bio)
                        .padding(.bottom, 2)
                }
                
                Text("CONTACT")
                    .fontWeight(.light)
                    .padding(.bottom, 2)
                
                
                HStack{
                    Text("Email :")
                        .fontWeight(.semibold)
                    Text(employee.email)
                }
                HStack {
                    if let number = employee.number {
                        Text("Phone Number:")
                            .fontWeight(.semibold)
                        Text(number)
                    }
                }
            }
            .padding(.vertical)
        }
        .onTapGesture(perform: selectOrDeselect)
        
    }
    
    private func selectOrDeselect(){
        withAnimation{
            if isSelected {
                selectedEmployee = nil
            } else {
                selectedEmployee = employee
            }
        }
    }
}

