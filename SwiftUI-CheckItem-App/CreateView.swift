//
//  CreateView.swift
//  SwiftUI-CheckItem-App
//
//  Created by 近藤米功 on 2022/12/03.
//

import SwiftUI

struct CreateView: View {
    enum Result {
        case save(String)
        case cancel
    }

    @State var name = ""
    @Binding var isPresented: Bool
    @Binding var result: Result

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("名前")
                    Spacer(minLength: 32)
                    TextField("プレースホルダー", text: $name)
                        .textFieldStyle(.roundedBorder)
                }
                Spacer()
            }
            .padding()
            .navigationTitle("項目の追加")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        result = .save(name)
                        isPresented = false
                    } label: {
                        Text("追加")
                    }.disabled(name.isEmpty) // nameが空の時は追加できないようにする
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        result = .cancel
                        isPresented = false
                    } label: {
                        Text("キャンセル")
                    }

                }
            }
        }
    }
}

private struct PreviewWrapper: View {

    @State var isPresented = false
    @State var result = CreateView.Result.cancel

    var body: some View {
        CreateView(isPresented: $isPresented, result: $result)
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
}
