//
//  HomeDataSource.swift
//  Twitter2.0
//
//  Created by Ronald Hernandez on 1/22/17.
//  Copyright © 2017 Ronaldoh1. All rights reserved.
//

import LBTAComponents

class HomeDataSource: Datasource {

    let words = ["user1", "user2", "user3"]

    override func numberOfItems(_ section: Int) -> Int {
        return words.count 
    }

    override func item(_ indexPath: IndexPath) -> Any? {
        return words[indexPath.item]
    }

    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }

    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }

    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }

}