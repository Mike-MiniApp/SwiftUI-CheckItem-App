//
//  ContentView.swift
//  SwiftUI-CheckItem-App
//
//  Created by 近藤米功 on 2022/12/02.
//

import SwiftUI

struct ContentView: View {
    @State var checkLists = [CheckList(name: "買い物リスト",checkItems: [CheckItem(isChecked: false, name: "りんご"),CheckItem(isChecked: true, name: "バナナ")])]

    @State var isPresented = false
    @State var createViewResult = CreateListView.Result.cancel

    var body: some View {
        NavigationStack {
            List {
                ForEach(checkLists, id: \.self) { checkList in
                    NavigationLink(value: checkList.uuid) {
                        Text(checkList.name)
                    }
                }
            }.navigationTitle("チェックリスト一覧")
                .navigationDestination(for: UUID.self, destination: { uuid in
                    let index = checkLists.firstIndex(where: { $0.uuid == uuid})!
                    CheckListView(checkList: $checkLists[index])
                })
                .toolbar {
                    ToolbarItem(placement: .automatic) {
                        Button {
                            isPresented = true
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }.fullScreenCover(isPresented: $isPresented,onDismiss: {
                    switch createViewResult {
                    case .save(let name):
                        checkLists.append(CheckList(name: name, checkItems: []))
                    case .cancel:
                        break
                    }
                }) {
                    CreateListView(isPresented: $isPresented,result: $createViewResult)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
