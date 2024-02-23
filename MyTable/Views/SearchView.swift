//
//  SearchPage.swift
//  my_table
//
//  Created by snlcom on 2023/08/14.
//

import SwiftUI

// TODO: add map view and functionality for map search to venu location
struct SearchView: View {
    
    var body: some View {
        VStack {
            Text("My Table")
                .font(.title.bold())
            SearchModule(
            )
            Spacer()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
