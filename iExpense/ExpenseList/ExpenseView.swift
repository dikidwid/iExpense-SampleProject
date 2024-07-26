//
//  ExpenseView.swift
//  iExpense
//
//  Created by Diki Dwi Diro on 26/07/24.
//

import SwiftUI

struct ExpenseView: View {
    @StateObject var expenseViewModel: ExpenseViewModel = ExpenseViewModel(dataSource: .shared)
    
    var body: some View {
        NavigationStack {
            List(expenseViewModel.expenses) { expense in
                HStack {
                    VStack(alignment: .leading) {
                        Text(expense.name)
                            .font(.headline)
                        
                        Text(expense.date.formatted(date: .abbreviated, time: .shortened))
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                    
                    Spacer()
                    
                    Text(expense.amount, format: .currency(code: "IDR"))
                        .fontDesign(.rounded)
                }
            }
            .listStyle(SidebarListStyle())
            .autocorrectionDisabled()
            .navigationTitle("New Expense")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Expense Sample") { expenseViewModel.addSampleExpense() }
                }
            }
        }
    }
}
