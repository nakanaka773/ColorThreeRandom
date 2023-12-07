import SwiftUI
import SwiftData

struct TodoListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var todoItems: [TodoItem]

    @State private var newTodoTitle: String = ""

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(todoItems) { todoItem in
                        HStack {
                            Text(todoItem.title)
                            Spacer()
                            if todoItem.isCompleted {
                                Image(systemName: "checkmark")
                            }
                        }
                        .onTapGesture {
                            updateTodoStatus(todoItem)
                        }
                    }
                    .onDelete(perform: deleteTodo)
                }
                .navigationTitle("Todo List")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: addTodo) {
                            Label("Add Todo", systemImage: "plus")
                        }
                    }
            }
                TextField("New Todo", text: $newTodoTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            
        }
    }

    private func addTodo() {
        withAnimation {
            let newTodo = TodoItem(title: newTodoTitle)
            modelContext.insert(newTodo)
            saveContext()
            newTodoTitle = ""
        }
    }

    private func updateTodoStatus(_ todoItem: TodoItem) {
        withAnimation {
            todoItem.isCompleted.toggle()
            saveContext()
        }
    }

    private func deleteTodo(at offsets: IndexSet) {
        withAnimation {
            offsets.map { todoItems[$0] }.forEach(modelContext.delete)
            saveContext()
        }
    }

    private func saveContext() {
        do {
            try modelContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    TodoListView()
        .modelContainer(for: TodoItem.self)
}
