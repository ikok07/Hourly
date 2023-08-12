//
//  test.swift
//  Hourly
//
//  Created by Kaloyan Petkov on 11.08.23.
//

import SwiftUI
import SwiftData

@Model
class TestData {
    @Attribute(.unique) let id: Int
    @Transient let consistentValue: Int = 0
    let name: String
    let value: Int
    let requirements: [Requirement]
    
    init(id: Int, name: String, value: Int) {
        self.id = id
        self.name = name
        self.value = value
    }
}

@Model
class Requirement {
    let r1: String
    let r2: String
    
    init(r1: String, r2: String) {
        self.r1 = r1
        self.r2 = r2
    }
}

func getData() {
    let container = try! ModelContainer(for: TestData.self)

    let context = ModelContext(container)
    
    let dataPredicate = #Predicate<TestData> { data in
        data.name == "Test Data" &&
        data.value >= 1
    }
    
    let descriptor = FetchDescriptor<TestData>(
        predicate: dataPredicate,
        sortBy: [SortDescriptor(\TestData.name)]
    )
    
    let results = try! context.fetch(descriptor)
    print(results)
}

func createData() {
    let container = try! ModelContainer(for: TestData.self)
    let context = ModelContext(container)
    
    let descriptor = FetchDescriptor<TestData>()
    let results = try! context.fetch(descriptor)
    
    let newData = TestData(id: results[results.count - 1].id + 1, name: "First", value: 1)
    
    context.insert(newData) // or context.delete(newData)
}
