//
//  Expense.swift
//  iExpense
//
//  Created by Diki Dwi Diro on 26/07/24.
//

import Foundation
import SwiftData

@Model
class Expense {
    var name: String
    var amount: Int
    var date: Date
    
    init(name: String, amount: Int, date: Date) {
        self.name = name
        self.amount = amount
        self.date = date
    }
}

extension Expense {
    static let dummyExpenses: [Expense] = [
        Expense(name: "Kasturi",
                amount: 15000,
                date: .now),
        
        Expense(name: "Hachi grill",
                amount: 170000,
                date: .now),
        
        Expense(name: "Soto ayam",
                amount: 25000,
                date: .now),
        
        Expense(name: "Gojek",
                amount: 12000,
                date: .now),
        
        Expense(name: "Parfume",
                amount: 15000,
                date: .now)
    ]
}
