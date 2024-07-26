//
//  ExpenseViewModel.swift
//  iExpense
//
//  Created by Diki Dwi Diro on 26/07/24.
//

import Foundation

class ExpenseViewModel: ObservableObject {
    @Published var expenses: [Expense] = []
    
    private let dataSource: SwiftDataService
    
    init(dataSource: SwiftDataService) {
        self.dataSource = dataSource
        
        // Insert dummy expenses to the SwiftData to see if fetching data is works
        let dummyExpenses = Expense.dummyExpenses
        for expense in dummyExpenses {
            dataSource.addExpense(expense)
        }
        
        expenses = dataSource.fetchExpenses()
    }
    
    func addSampleExpense() {
        let expense = Expense(name: "Sample Expense",
                              amount: 10000,
                              date: .now)
        dataSource.addExpense(expense)
        
        // Manually fetch the latest expenses
        expenses = dataSource.fetchExpenses()
    }
}
