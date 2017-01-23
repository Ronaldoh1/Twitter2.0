//
//  HomeDataSourceController.swift
//  Twitter2.0
//
//  Created by Ronald Hernandez on 1/22/17.
//  Copyright © 2017 Ronaldoh1. All rights reserved.
//


import LBTAComponents

class HomeDataSourceController: DatasourceController {

    override func viewDidLoad() {
        super.viewDidLoad()
     

        let homeDataSource = HomeDataSource()
        self.datasource = homeDataSource
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }

    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 150)
    }

}
