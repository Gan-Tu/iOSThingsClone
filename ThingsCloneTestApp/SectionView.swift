//
//  SectionView.swift
//  ThingsCloneTestApp
//
//  Created by Gan Tu on 7/9/23.
//

import SwiftUI

struct SectionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Image(systemName: "circle.righthalf.filled")
                    .foregroundColor(.accentColor)
                Text(GenerateTitle())
                    // "Things to do"
                    .bold()
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .bold()
            }
            .padding(5)
            
            Divider()

            CheckListItem(text: GenerateTitle(),
                          notes: GenerateNotes())
            CheckListItem(text: GenerateTitle(),
                          notes: GenerateNotes())
        }
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView()
            .padding()
    }
}
