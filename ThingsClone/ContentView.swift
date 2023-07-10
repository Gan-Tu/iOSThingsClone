//
//  ContentView.swift
//  ThingsClone
//
//  Created by Gan Tu on 7/9/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = HomeViewModel()
    
    let sections = [section1Items, section2Items, section3Items]
    
    var body: some View {
        ScrollView {
            ZStack {
                Color.clear
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation {
                            vm.updateSelectedItemId(nil)
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
                    
                    VStack(spacing: 40) {
                        ForEach(0..<sections.count, id: \.self) { index in
                            SectionView(title: "Section \(index+1)", items: sections[index])
                        }
                    }

                    Spacer()
                }
                .padding(.horizontal, 20)
                .foregroundColor(.black)
            }
        }
        .environmentObject(vm)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
