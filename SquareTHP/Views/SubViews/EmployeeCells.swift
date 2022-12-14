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


extension EmployeeCells {
    private var collapsedView: some View {
        HStack {
                ImageView(urlString: employee.photo ?? "n/a")
                .matchedGeometryEffect(id: employee.id, in: profileView)
            .frame(width: 75, height: 75)
            VStack(alignment: .leading) {
                Text(employee.name)
                    .font(.headline)
                    .matchedGeometryEffect(id: employee.name, in: profileView)
                Text(employee.team)
                    .foregroundColor(.gray)
                    .italic()
                    .matchedGeometryEffect(id: employee.team, in: profileView)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            VStack {
                Spacer()
                Image(systemName: "chevron.down")
                    .padding(.bottom, 2)
            }
        }
        .onTapGesture(perform: selectOrDeselect)
    }
    
    private var expandedView: some View {
        VStack {
                ImageView(urlString: employee.photo ?? "n/a")
                .matchedGeometryEffect(id: employee.id, in: profileView)
                .frame(width: 150, height: 150)
            Text(employee.name)
                .font(.headline)
                .matchedGeometryEffect(id: employee.name, in: profileView)
            Text(employee.team)
                .foregroundColor(.gray)
                .italic()
                .matchedGeometryEffect(id: employee.team, in: profileView)
            
            VStack(alignment: .leading) {
                if let bio = employee.bio {
                    Text("BIO")
                        .fontWeight(.bold)
                        .underline()
                        .padding(.bottom, 2)
                    
                    Text(bio)
                        .padding(.bottom, 2)
                }
                
                Text("CONTACT")
                    .fontWeight(.bold)
                    .underline()
                    .padding(.bottom, 2)
                
                
                HStack{
                    Text("Email:")
                        .fontWeight(.semibold)
                    Text(employee.email)
                        .lineLimit(1)
                        .minimumScaleFactor(0.6)
                        
                }
                HStack {
                    if let number = employee.number {
                        Text("Phone Number:")
                            .fontWeight(.semibold)
                        Text(number.asPhoneNumber())
                    }
                }
            }
            .frame(maxWidth: .infinity)
//            .padding(.vertical)
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

