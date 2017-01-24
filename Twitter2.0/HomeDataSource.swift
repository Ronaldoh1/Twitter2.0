//
//  HomeDataSource.swift
//  Twitter2.0
//
//  Created by Ronald Hernandez on 1/22/17.
//  Copyright © 2017 Ronaldoh1. All rights reserved.
//

import LBTAComponents

class HomeDataSource: Datasource {

    let users: [User] =  {
        let ronUser = User(name: "Ronald Hernandez", username: "@Ronaldoh1", bioText: "Ronald is iOS Developer. He is currently working on learning advanced Swift. He's very excided about iOS Development. He is also a big fan of Dragonball Super. He also likes all of Biden Memes!", profileImage: #imageLiteral(resourceName: "goku"))
        let rayUser = User(name: "Ray Wenderlich", username: "@rwenderlich", bioText: "Ray Wenderlich is an iPhone developer and tweets on topics related to iPhone, software development, gaming. Check out our Conference :)", profileImage: #imageLiteral(resourceName: "ray"))
        let vegetaUser = User(name: "Vegeta San", username: "@priceOfSaiyans", bioText: "Vegeta is always training. He wants to surpass Goku. I used to be a bad person but not anymore. I did surpass the regular Super Saiya and now I am a Super Saiyan God. I am currently trianing along with Whiz San. I will not let anyone be stronger than me. If you need to reach me call Bulma. That woman will take all my important messages. I do not have times to play games.", profileImage: #imageLiteral(resourceName: "vegeta"))

        return [ronUser, rayUser, vegetaUser]
    }()

    override func numberOfItems(_ section: Int) -> Int {
        return users.count
    }

    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.item]
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
