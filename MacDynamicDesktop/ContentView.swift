//
//  ContentView.swift
//  MacDynamicDesktop
//
//  Created by Lars Krämer on 15.07.23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        VStack {
                            VStack {
                                Image("win11_light")
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(4)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                Text("Aktuelle Vorschau-Grafik")
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            
                            HStack {
                                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                            }
                            .frame(maxWidth: .infinity, maxHeight: 40)
                            
                            HStack {
                                Text("Slider mit allen Grafiken")
                            }
                            .frame(maxWidth: .infinity, maxHeight: 120)
                        }
                        .frame(maxHeight: .infinity)
                    } label: {
                        
                        VStack {
                            
                            HStack {
                                Image("win11_light")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: .infinity)
                                    .cornerRadius(4)
                            }
                            
                            HStack {
                                Text(item.timestamp!, formatter: itemFormatter)
                                    .font(.caption)
                                    .padding(.vertical)
                            }
                            .frame(maxWidth: .infinity)
                            
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
