//
//  ContentView.swift
//  MacDynamicDesktop
//
//  Created by Lars Krämer on 15.07.23.
//

import SwiftUI
import CoreData

private let wallpaperPacks: [WallpaperPack] = [
    WallpaperPack(name: "Windows 11", images: ["win11_light", "win11_dark"], previewImage: "win11_dark"),
    WallpaperPack(name: "Windows 10", images: ["win11_light", "win11_dark"]),
]

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                ForEach(wallpaperPacks) { wallpaperPack in
                    
                    NavigationLink {
                        
                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                        ], spacing: 16) {
                            
                            HStack {
                                Image(wallpaperPack.PreviewImage)
                                    .resizable()
                                    .scaledToFill()
                                    .cornerRadius(4)
                            }
                            .frame(maxWidth: .infinity)
                            .cornerRadius(10)
                            
                            
                            HStack {
                                Text(wallpaperPack.Name)
                                    .frame(height: 40)
                                    .font(.title)
                            }
                            .frame(maxWidth: .infinity)
                            .cornerRadius(10)
                            
                            HStack {
                                Text("Grafik-Slider")
                                    .frame(height: 120)
                            }
                            .frame(maxWidth: .infinity)
                            .cornerRadius(10)
                        }
                        .padding()
                        
                    } label: {
                        
                        VStack {
                            
                            HStack {
                                
                                Image(wallpaperPack.PreviewImage)
                                    .resizable()
                                    .scaledToFill()
                                    .cornerRadius(4)
                                
                            }
                            
                            HStack {
                                
                                Text(wallpaperPack.Name)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
