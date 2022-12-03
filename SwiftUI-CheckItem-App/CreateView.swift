//
//  CreateView.swift
//  SwiftUI-CheckItem-App
//
//  Created by 近藤米功 on 2022/12/03.
//

import SwiftUI

struct CreateView: View {
    @Binding var name: String
    @Binding var isPresented: Bool
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
                ToolbarItem(placement: .automatic) {
                    Button {
                        isPresented = false
                    } label: {
                        Text("追加")
                    }

                }
            }
        }
    }
}

private struct PreviewWrapper: View {

    @State var name = ""
    @State var isPresented = false

    var body: some View {
        CreateView(name: $name, isPresented: $isPresented)
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
}
