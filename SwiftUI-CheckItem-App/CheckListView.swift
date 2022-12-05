//
//  CheckListView.swift
//  SwiftUI-CheckItem-App
//
//  Created by 近藤米功 on 2022/12/05.
//

import SwiftUI

struct CheckListView: View {
    @State var checkItems = [CheckItem(isChecked: false, name: "りんご"),CheckItem(isChecked: true, name: "バナナ")]

    @Binding var checkList: CheckList

    @State var isPresented = false
    @State var createViewResult = CreateView.Result.cancel

    var body: some View {
        VStack {
                VStack {
                    ForEach(checkList.checkItems.indices, id: \.self) { index in
                        CheckItemView(checkItem: $checkList.checkItems[index])
                    }
                    Spacer()
                }.navigationTitle(checkList.name)
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

private struct PreviewWrapper: View {
    @State var checkList = CheckList(name: "買い物リスト",checkItems: [CheckItem(isChecked: false, name: "りんご"),CheckItem(isChecked: true, name: "バナナ")])

    var body: some View {
        CheckListView(checkList: $checkList)
    }
}

struct CheckListView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
}
