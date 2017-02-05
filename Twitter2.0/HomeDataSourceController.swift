//
//  HomeDataSourceController.swift
//  Twitter2.0
//
//  Created by Ronald Hernandez on 1/22/17.
//  Copyright © 2017 Ronaldoh1. All rights reserved.
//


import LBTAComponents
import TRON
import SwiftyJSON

class HomeDataSourceController: DatasourceController {

    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

//        let homeDataSource = HomeDataSource()
//        self.datasource = homeDataSource
        setupNavigationBarItems()

        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)

        fetchHomeFeed()
    }

//    class Home: JSONDecodable {
//
//  
//    }

    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
    }

    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com/")

    fileprivate func fetchHomeFeed() {


        let request: APIRequest<HomeDataSource, JSONError> = tron.request("twitter/home")
        request.perform(withSuccess: { (homeDatasource) in
            print(homeDatasource.users.count)
            self.datasource = homeDatasource
        }) { (error) in
            print("Failed to fetch json", error)
        }

    }

    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if let user = self.datasource?.item(indexPath) as? User {
            //let's get an estimate of the height of our cell based on user.biotext

            //get estimated size for the text

            let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2
            let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
            let attributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]

            let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size , options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 66)
        }

        return CGSize(width: view.frame.width, height: 200)
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {

        if section == 1 {
          return CGSize.zero
        }

        return CGSize(width: view.frame.width, height: 50)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {

        if section == 1 {
            return CGSize.zero
        }

        return CGSize(width: view.frame.width, height: 64)
    }

    
}
