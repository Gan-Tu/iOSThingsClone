//
//  ContentView.swift
//  ThingsCloneTestApp
//
//  Created by Gan Tu on 7/9/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedItemId : UUID? = nil
    
    private var hasExpandedBlock: Bool {
        selectedItemId != nil
    }
    
    var body: some View {
        ZStack {
            // Click outside of view closes all active items
            Color.clear
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation {
                        selectedItemId = nil
                    }
                }
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("Today")
                        .foregroundColor(.black)
                        .bold()
                }
                .font(.title2)
                .padding(.bottom, 20)
                
                
                HStack(alignment: .center) {
                    Image(systemName: "circle.righthalf.filled")
                        .foregroundColor(.accentColor)
                    Text("Things to do")
                        .bold()
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .bold()
                }
                .padding(5)
                
                Divider()

                CheckListItem(text: "Find Wallet", selectedItemId: $selectedItemId)

                CheckListItem(text: "Buy Groceries",
                              notes: "Milk and Tea",
                              selectedItemId: $selectedItemId)

                Spacer()
            }
            .padding()
            .foregroundColor(.black)
        }
    }
}

struct Checkbox: View {
    @Binding var isComplete: Bool
    
    var body: some View {
        Button(action: {
            withAnimation {
                isComplete.toggle()
            }
        }, label: {
            Image(systemName: isComplete ? "checkmark.square.fill" : "square")
                .imageScale(.large)
                .foregroundColor(isComplete ? .accentColor : .gray)
        })
    }
}

struct CheckListItem: View {
    var id = UUID()
    var text = ""
    var notes = ""

    @Binding var selectedItemId: UUID?

    @State private var isComplete = false
    
    private var isExpanded: Bool {
        selectedItemId == id
    }
    
    var body: some View {
        if !isExpanded {
            Button(action: {
                withAnimation {
                    selectedItemId = id
                }
            }, label: {
                HStack(alignment: .top) {
                    Checkbox(isComplete: $isComplete)
                    VStack(alignment: .leading) {
                        Text(text)
                            .foregroundColor(isComplete ? .gray : .black)
                            .strikethrough(isComplete)
                        Spacer()
                    }
                    .frame(alignment: .top)
                    Spacer()
                }
                .padding(5)
                .frame(height: isExpanded ? 200 : 30, alignment: .top)
            })
        } else {
            HStack(alignment: .top) {
                Checkbox(isComplete: $isComplete)
                
                VStack(alignment: .leading) {
                    Text(text)
                        .foregroundColor(isComplete ? .gray : .black)
                    
                    Text(notes.isEmpty ? "Notes" : notes)
                        .foregroundColor(notes.isEmpty ? .gray : .black)
                        .padding(.top, 2)
                        .font(.footnote)
                        .frame(height: 50, alignment: .top)
                    
                    Spacer()
                    
                    HStack {
                        Button(action: {
                            // todo
                        }, label: {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text("Today")
                                .font(.callout)
                                .foregroundColor(.black)
                                .bold()
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
            .frame(height: isExpanded ? 200 : 30, alignment: .top)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
