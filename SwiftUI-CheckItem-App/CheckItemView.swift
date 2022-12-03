//
//  CheckItemView.swift
//  SwiftUI-CheckItem-App
//
//  Created by 近藤米功 on 2022/12/02.
//

import SwiftUI

struct CheckItemView: View {
    @Binding var checkItem: CheckItem

    var body: some View {
        HStack(spacing: 16) {
            Button {
                checkItem.isChecked.toggle()
            } label: {
                Image(systemName: checkItem.isChecked ?
                      "checkmark.circle.fill": "circle")
                .resizable()
                .frame(width: 50,height: 50)
                .foregroundColor(checkItem.isChecked ? Color.green: Color.gray)
            }

            Text(checkItem.name)
            Spacer()
        }
        .padding()
    }
}

// Previewの補助
private struct PreviewWrapper: View {
    @State var checkItem = CheckItem(isChecked: false, name: "りんご")

    var body: some View {
        CheckItemView(checkItem: $checkItem)
    }
}

struct CheckItemView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
}
