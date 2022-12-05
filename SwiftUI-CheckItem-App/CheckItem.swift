//
//  CheckItem.swift
//  SwiftUI-CheckItem-App
//
//  Created by 近藤米功 on 2022/12/02.
//

import Foundation

struct CheckItem: Hashable {
    var isChecked: Bool
    var name: String
}

struct CheckList: Hashable, Identifiable {
    let uuid: UUID = UUID()
    var name: String
    var checkItems: [CheckItem]

    var id: UUID { uuid }
}
