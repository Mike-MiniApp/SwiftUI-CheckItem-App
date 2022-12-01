//
//  ContentView.swift
//  SwiftUI-CheckItem-App
//
//  Created by 近藤米功 on 2022/12/02.
//

import SwiftUI

struct ContentView: View {
    @State var checkItems = [ CheckItem(isChecked: false, name: "りんご"),CheckItem(isChecked: true, name: "バナナ")]

    var body: some View {
        NavigationStack {
            VStack {
                ForEach(checkItems.indices, id: \.self) { index in
                   CheckItemView(checkItem: $checkItems[index])
                }
            }.navigationTitle("チェックリスト")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
