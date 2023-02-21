//
//  MemoStore.swift
//  Memo_TCA
//
//  Created by 박성민 on 2023/02/22.
//


import SwiftUI
import RealmSwift

class MemoStore: ObservableObject {

    @Published var memos: [Memo] = []
    
    init() {
        fetchData()
    }
    
    // 데이터 읽기
    func fetchData() {
        
        guard let dbRef = try? Realm() else { return }
        
        let results = dbRef.objects(Memo.self)
        
        self.memos = results.compactMap({ memo -> Memo? in
            return memo
        })
    }
    // 데이터 추가
    func addData(title: String, content: String) {
        let memo = Memo()
        memo.id = UUID().uuidString
        memo.title = title
        memo.content = content
        memo.createdAt = Date.now
        
        guard let dbRef = try? Realm() else { return }
        
        try? dbRef.write {
            
            dbRef.add(memo)
            
            fetchData()
        }
    }
    
    // 데이터 삭제
    func deleteData(memo: Memo) {
        
        guard let dbRef = try? Realm() else { return }
        
        try? dbRef.write {
            
            dbRef.delete(memo)
            
            fetchData()
        }
    }
    
    // 데이터 업데이트
    func updateData(memo: Memo, title: String, content: String) {
        
        guard let dbRef = try? Realm() else { return }
        
        try? dbRef.write {
            
            memo.title = title
            memo.content = content
            
            fetchData()
        }
    }
    
}
