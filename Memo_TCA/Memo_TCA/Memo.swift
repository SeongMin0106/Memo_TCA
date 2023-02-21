//
//  Memo.swift
//  Memo_TCA
//
//  Created by 박성민 on 2023/02/22.
//

import Foundation
import RealmSwift

class Memo: Object, Identifiable {
    @objc dynamic var id: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var content: String = ""
    @objc dynamic var createdAt: Date = Date()
}
