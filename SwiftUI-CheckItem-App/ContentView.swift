//
//  ContentView.swift
//  SwiftUI-CheckItem-App
//
//  Created by 近藤米功 on 2022/12/02.
//

import SwiftUI

struct ContentView: View {
    @State var checkItems = [CheckItem(isChecked: false, name: "りんご"),CheckItem(isChecked: true, name: "バナナ")]

    @State var checkList = CheckList(checkItems: [CheckItem(isChecked: false, name: "りんご"),CheckItem(isChecked: true, name: "バナナ")])

    @State var isPresented = false
    @State var createViewResult = CreateView.Result.cancel

    var body: some View {
        VStack {
            NavigationStack {
                VStack {
                    ForEach(checkList.checkItems.indices, id: \.self) { index in
                        CheckItemView(checkItem: $checkList.checkItems[index])
                    }
                    Spacer()
                }.navigationTitle("チェックリスト")
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
                            checkList.checkItems.append(CheckItem(isChecked: false, name: name))
                        case .cancel:
                            break
                        }
                    }) {
                        CreateView(isPresented: $isPresented,result: $createViewResult)
                    }// fullScreenCoverは画面遷移
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
