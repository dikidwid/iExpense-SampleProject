//
//  SwiftDataService.swift
//  iExpense
//
//  Created by Diki Dwi Diro on 26/07/24.
//

import SwiftData

class SwiftDataService {
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    
    @MainActor
    static let shared = SwiftDataService()
    
    @MainActor
    private init() {
        
        // Change isStoredInMemoryOnly to false if you would like to see the data persistance after kill/exit the app
        self.modelContainer = try! ModelContainer(for: Expense.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        self.modelContext = modelContainer.mainContext
    }
    
    func fetchExpenses() -> [Expense] {
        do {
            return try modelContext.fetch(FetchDescriptor<Expense>())
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func addExpense(_ expense: Expense) {
        modelContext.insert(expense)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
