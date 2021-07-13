//
//  NonCompanyUserViewController.swift
//  TersApp
//
//  Created by Macbook on 6. 6. 2021..
//

import UIKit

class NonCompanyUserViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, MenuViewDelegate, SearchHeaderDelegate {
    
    @IBOutlet weak var menuViewContainer: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let menuView = MenuView.instanceFromNib() as! MenuView
    private let searchView = SearchHeaderView.instanceFromNib() as! SearchHeaderView
    
    private let itemsPerRow: CGFloat = 4
    private let sectionInsets = UIEdgeInsets(
      top: 10.0,
      left: 10.0,
      bottom: 15.0,
      right: 10.0)

   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        collectionView.backgroundColor = UIColor(hexString: "#FAFAFB")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "UserCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "UserCollectionViewCell")
       
        collectionView.register(SearchHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SearchHeaderView.identifier)
    
        menuViewContainer.addSubview(menuView)
        collectionView.addSubview(searchView)
        menuView.delegate = self
        searchView.delegate = self
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.headerReferenceSize = CGSize(width: 0, height: 60)
        layout.sectionHeadersPinToVisibleBounds = true
        collectionView!.collectionViewLayout = layout
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillLayoutSubviews() {
        menuView.frame = menuViewContainer.bounds
        searchView.frame = collectionView.bounds
    }


    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SearchHeaderView.identifier, for: indexPath) as! SearchHeaderView

        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: 0, height: 20)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCollectionViewCell", for: indexPath) as! UserCollectionViewCell
        cell.setup()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     
        let paddingSpace = 48 * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem + 30.0)
    }
    
        func collectionView(_ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
      ) -> UIEdgeInsets {
        return sectionInsets
      }
      
      
      func collectionView(_ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
      ) -> CGFloat {
        return sectionInsets.left
      }
    
    func didTap(item: MenuItemType) {
        switch item {
        case .home:
            print("printaj home")

        case .add:
            print("printaj add")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc =
                storyboard.instantiateViewController(identifier: "AddViewController") as! AddViewController
            navigationController?.pushViewController(vc, animated: true)
           
        case .search:
            print("Printaj src")

        case .doc:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc =
                storyboard.instantiateViewController(identifier: "ProfileUserViewController") as! ProfileUserViewController
            navigationController?.pushViewController(vc, animated: true)

        }
    }
    func didTap(item: SearchHeaderItemType) {
        print("pretraga")
    }
  
    
    
}




