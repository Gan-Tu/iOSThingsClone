//
//  SectionView.swift
//  ThingsCloneTestApp
//
//  Created by Gan Tu on 7/9/23.
//

import SwiftUI

struct SectionView: View {
    var title: String
    var items: [TodoItem]

    @EnvironmentObject var vm: HomeViewModel

    var body: some View {
        LazyVStack(alignment: .leading) {
            HStack(alignment: .center) {
                Image(systemName: "circle.righthalf.filled")
                    .foregroundColor(.accentColor)
                Text(title).bold()
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .bold()
            }
            .padding(5)

            Divider()

            ForEach(items, id: \.id) { item in
                CheckListItem(item: item)
            }
        }
    }
}

struct SectionView_Previews: PreviewProvider {
    static let vm: HomeViewModel = HomeViewModel()
    static var items = [
        TodoItem(title: GenerateTitle(), notes: GenerateNotes()),
        TodoItem(title: GenerateTitle(), notes: GenerateNotes()),
    ]
    
    static var previews: some View {
        VStack {
            SectionView(title: "Section Title", items: items).padding()
        }
        .environmentObject(vm)
    }
}
