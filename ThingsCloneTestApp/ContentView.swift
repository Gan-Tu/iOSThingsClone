//
//  ContentView.swift
//  ThingsCloneTestApp
//
//  Created by Gan Tu on 7/9/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedItemId : UUID? = nil
    @State private var hasExpandedItem: Bool = false
    
    var body: some View {
        ZStack {
            Color.clear
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation {
                        hasExpandedItem = true
                    }
                }
                .edgesIgnoringSafeArea(.all)

            ScrollView {
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
                    
                    VStack(spacing: 40) {
                        SectionView()
                        SectionView()
                        SectionView()
                    }

                    Spacer()
                }
                .padding(.horizontal, 10)
                .foregroundColor(.black)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
