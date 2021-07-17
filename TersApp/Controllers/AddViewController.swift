//
//  AddViewController.swift
//  TersApp
//
//  Created by Macbook on 12. 7. 2021..
//

import UIKit

class AddViewController: UIViewController, MenuViewDelegate {
   
    
    
    @IBOutlet weak var menuContainer: UIView!
    @IBOutlet weak var formView: UIView!
    
    @IBOutlet weak var saveBtn: UIButton!
    
    private let menuView = MenuView.instanceFromNib() as! MenuView
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
        menuContainer.addSubview(menuView)
        menuView.delegate = self
        
        setup()
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    override func viewWillLayoutSubviews() {
        menuView.frame = menuContainer.bounds
    }
    
    func setup(){
        formView.layer.cornerRadius = 10.0
    
        saveBtn.layer.cornerRadius = 7
        saveBtn.layer.backgroundColor = UIColor(hexString: "F9EC1E").cgColor
        
    }
    
    func didTap(item: MenuItemType) {
        switch item {
        case .home:
            print("printaj home")
        case .search:
           print("Printaj src Almir")

        case .add:
            print("printaj add")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc =
                storyboard.instantiateViewController(identifier: "AddViewController") as! AddViewController
            navigationController?.pushViewController(vc, animated: true)
            
        
        case .doc:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc =
                storyboard.instantiateViewController(identifier: "ProfileUserViewController") as! ProfileUserViewController
            navigationController?.pushViewController(vc, animated: true)

     
        }
    }
    
}