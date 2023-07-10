//
//  CheckListItem.swift
//  ThingsCloneTestApp
//
//  Created by Gan Tu on 7/9/23.
//

import SwiftUI

struct CheckListItem: View {
    var item: TodoItem
    
    @ObservedObject var vm: HomeViewModel

    @State private var isComplete = false
    @State private var isSwiped = false
    
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
            HStack(alignment: .top) {
                Checkbox(isComplete: $isComplete)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(item.title)
                            .foregroundColor(isComplete ? .gray : .black)
                        
                        Spacer()
                    }
                    
                    Text(item.notes.isEmpty ? "Notes" : item.notes)
                        .foregroundColor(item.notes.isEmpty ? .gray : .black)
                        .padding(.top, 2)
                        .font(.footnote)
                    
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
                            // todo
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
            .padding(5)
            .frame(height: isExpanded ? 150 : 30, alignment: .top)
        }
    }
}
struct CheckListItem_Previews: PreviewProvider {
    static let vm: HomeViewModel = HomeViewModel()
    static let item1 = TodoItem(title: "Title 1", notes: "")
    static let item2 = TodoItem(title: "Title 2", notes: "Ok Hello")
    
    static var previews: some View {
        ZStack {
            Color.clear
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation {
                        vm.updateSelectedItemId(nil)
                    }
                }
                .edgesIgnoringSafeArea(.all)
            
            
            VStack(spacing: 20) {
                CheckListItem(item: item1, vm: vm)
                CheckListItem(item: item2, vm: vm)
            }
        }
    }
}
