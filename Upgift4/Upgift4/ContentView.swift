//
//  ContentView.swift
//  Upgift4
//
//  Created by Soniya Ghorbani on 2024-11-24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \TodoItem.isCompletedInt) private var todoItems: [TodoItem]

    @State private var newTodoTitle = ""

    var body: some View {
        NavigationSplitView {
            // Master view: List of Todo items
            VStack {
                // Text field for entering new todo title
                TextField("Enter Todo", text: $newTodoTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Add Todo") {
                    addTodoItem()
                }
                .padding()
                .buttonStyle(.borderedProminent)

                // List of Todo items
                List {
                    ForEach(todoItems) { item in
                        HStack {
                            Text(item.title)
                            Spacer()
                            Text(item.isCompleted ? "DONE" : "PENDING")
                                .foregroundColor(item.isCompleted ? .green : .red)
                        }
                        .contentShape(Rectangle())  // Make the whole row tappable
                        .onTapGesture {
                            // Toggle the completion status when tapped
                            item.isCompleted.toggle()
                            try? modelContext.save()  // Save changes
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()  // Enable row deletion
                }
            }
        } detail: {
            // Detail view content, just show a placeholder text
            Text("Select a Todo Item")
                .font(.headline)
                .padding()
        }
    }

    private func addTodoItem() {
        guard !newTodoTitle.isEmpty else { return }
        
        let newTodo = TodoItem(title: newTodoTitle, isCompleted: false)
        modelContext.insert(newTodo)
        try? modelContext.save()  // Save the new Todo

        newTodoTitle = ""  // Clear input field after adding the Todo item
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(todoItems[index])
            }
            try? modelContext.save()  // Save after deletion
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: TodoItem.self, inMemory: true)  // Use in-memory storage for preview
}
