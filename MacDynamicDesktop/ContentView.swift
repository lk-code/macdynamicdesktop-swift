//
//  ContentView.swift
//  MacDynamicDesktop
//
//  Created by Lars Krämer on 15.07.23.
//

import SwiftUI
import CoreData

private let images = ["win11_light", "win11_dark"]

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
                        
                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                        ], spacing: 16) {
                            
                            HStack {
                                Text("Vorschau-Grafik")
                                    .frame(height: .infinity)
                            }
                            .frame(maxWidth: .infinity)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            
                            
                            HStack {
                                Text("Paket-Name")
                                    .frame(height: 40)
                            }
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            
                            HStack {
                                Text("Grafik-Slider")
                                    .frame(height: 120)
                            }
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding()
                        
                    } label: {
                        
                        VStack {
                            
                            HStack {
                                Image("win11_light")
                                    .resizable()
                                    .scaledToFill()
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
                
                ToolbarItem {
                    
                    Button(action: deleteItem) {
                        Label("Delete Item", systemImage: "trash")
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
    
    private func deleteItem() {
        
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
