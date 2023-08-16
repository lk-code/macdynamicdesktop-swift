//
//  MainView.swift
//  MacDynamicDesktop
//
//  Created by Lars Krämer on 16.08.23.
//

import SwiftUI

private let wallpaperPacks: [WallpaperPack] = [
    WallpaperPack(name: "Windows 11", images: ["win11_light", "win11_dark"], previewImage: "win11_dark"),
    WallpaperPack(name: "Windows 10", images: ["win11_light", "win11_dark"]),
]

struct MainView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
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
            
        }
    }
    
    private func deleteItem() {
        
        withAnimation {
            
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        
        withAnimation {
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
