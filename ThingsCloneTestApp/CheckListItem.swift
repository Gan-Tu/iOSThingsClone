//
//  CheckListItem.swift
//  ThingsCloneTestApp
//
//  Created by Gan Tu on 7/9/23.
//

import SwiftUI

struct CheckListItem: View {
    @StateObject var item: TodoItem
    
    @EnvironmentObject var vm: HomeViewModel

    @State private var isComplete = false
    @State private var isSwiped = false
    @State private var hasLists = false
    
    private var isExpanded: Bool {
        vm.selectedItemId == item.id
    }
    
    var body: some View {
        if !isExpanded {
            Button(action: {
                withAnimation {
                    vm.updateSelectedItemId(item.id)
                }
            }, label: {
                ZStack {
                    if isSwiped {
                        Color.accentColor
                            .cornerRadius(5)
                            .opacity(0.2)
                    }
                    
                    HStack(alignment: .top) {
                        Checkbox(isComplete: $isComplete)

                        Text(item.title)
                            .foregroundColor(isComplete ? .gray : .black)
                            .strikethrough(isComplete)

                        Spacer()
                        
                        if isSwiped {
                            Image(systemName: "circle.inset.filled")
                                .foregroundColor(.accentColor)
                        }
                    }
                    .padding(5)
                }
                .frame(height: isExpanded ? 200 : 30, alignment: .top)
            })
            .highPriorityGesture(
                DragGesture(minimumDistance: 50)
                    .onEnded { value in
                        if value.translation.width < 0 {
                            isSwiped.toggle()
                        }
                    }
            )
        } else {
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .cornerRadius(5)
                    .shadow(color: .gray.opacity(0.3), radius: 3)
                
                HStack(alignment: .top) {
                    Checkbox(isComplete: $isComplete)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            TextField(
                                item.title.isEmpty ? "New To-Do" : item.title,
                                text: $item.title,
                                axis: .vertical)
                            Spacer()
                        }

                        TextField(item.notes.isEmpty ? "Notes" : item.notes, text: $item.notes, axis: .vertical)
                            .foregroundColor(item.notes.isEmpty ? .gray : .black)
                            .padding(.top, 2)
                            .padding(.bottom, 10)
                            .font(.footnote)
                        
//                        TextEditor(text: $item.notes)
//                            .foregroundColor(item.notes.isEmpty ? .gray : .black)
                        
                        if hasLists {
                            Spacer()
                            
                            Divider()
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    Image(systemName: "circle")
                                        .foregroundColor(.accentColor)
                                    Text("List Item 1")
                                }
                                
                                Divider()
                                
                                HStack {
                                    Image(systemName: "circle")
                                        .foregroundColor(.accentColor)
                                    Text("List Item 2")
                                }
                                
                                Divider()
                                
                                HStack {
                                    Image(systemName: "checkmark")
                                    Text("List Item 2").strikethrough()
                                }
                                .foregroundColor(.gray)
                            }
                            .font(.caption)
                            
                            Divider()
                        }
                        
                        Spacer()
                        
                        HStack {
                            Button(action: {
                                // todo
                            }, label: {
                                if item.isToday {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                    Text("Today")
                                        .font(.callout)
                                        .foregroundColor(.black)
                                        .bold()
                                } else {
                                    Image(systemName: "archivebox.fill")
                                        .foregroundColor(.brown)
                                    Text("Someday")
                                        .font(.callout)
                                        .foregroundColor(.black)
                                        .bold()
                                }
                            })
                            
                            Spacer()
                            
                            Button(action: {
                                // todo
                            }, label: {
                                Image(systemName: "tag")
                                    .rotationEffect(.degrees(270))
                            })
                            
                            Button(action: {
                                withAnimation {
                                    hasLists.toggle()
                                }
                            }, label: {
                                Image(systemName: "list.bullet")
                            })
                            
                            Button(action: {
                                // todo
                            }, label: {
                                Image(systemName: "flag")
                            })
                        }
                        .foregroundColor(.gray)
                    }
                    .frame(alignment: .top)
                    
                    Spacer()
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 20)
                .frame(alignment: .top)
            }
            .frame(height: isExpanded ? hasLists ? 250 : 180 : 30)
        }
    }
}

struct CheckListItem_Previews: PreviewProvider {
    static var vm: HomeViewModel = HomeViewModel()
    static var item1 = TodoItem(id: "item1", title: "Title 1", notes: "")
    static var item2 = TodoItem(id: "item2", title: "Title 2", notes: "Ok Hello")
    static var item3 = TodoItem(id: "item3", title: "Title 3", notes: "Ok Hello")
    
    static var previews: some View {
        vm.selectedItemId = "item2"
        
        return ZStack {
            Color.clear
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation {
                        vm.updateSelectedItemId(nil)
                    }
                }
                .edgesIgnoringSafeArea(.all)
            
            
            VStack(spacing: 20) {
                CheckListItem(item: item1)
                CheckListItem(item: item2)
                CheckListItem(item: item3)
            }
            .padding()
        }
        .environmentObject(vm)
    }
}
