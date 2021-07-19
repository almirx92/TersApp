//
//  AddViewController.swift
//  TersApp
//
//  Created by Macbook on 12. 7. 2021..
//

import UIKit
import Eureka

class AddViewController: FormViewController, MenuViewDelegate {
   
    @IBOutlet weak var menuContainer: UIView!
    @IBOutlet weak var tableViewContainer: UIView!
    
    private let menuView = MenuView.instanceFromNib() as! MenuView 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        tableView.frame = tableViewContainer.frame
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        // Do any additional setup after loading the view.
        menuContainer.addSubview(menuView)
        menuView.delegate = self
        setup()
        form
            +++ Section("JIB")
            <<< TextRow(){ row in
                row.placeholder = "4303425000001"
                
                
            }
            +++ Section("PDV")
            <<< TextRow(){ row in
                row.placeholder = "303425000001"
            }
      
            // Placeholder row for the border
            <<< TextRow() { row in

            }.cellSetup({ cell, row in
                cell.height = {50.0}
                cell.addBorder(for: .bottom, withColor: UIColor(hexString: "#F1F1F5"), borderWidth: 1.0)
                cell.isUserInteractionEnabled = false
                
               
                
            })

            +++ Section("Email Address")
            <<< TextRow(){ row in
                row.placeholder = "pearshadow@gmail.com"
            }
            +++ Section("Company Address")
            <<< TextRow(){ row in
                row.placeholder = "24. Juna br. 15 71320, Vogosca, Bosna i Hercegovina"
            }
            +++ Section("Phone Number")
            <<< TextRow(){ row in
                row.placeholder = "+62 812 231 731 / +62 811 984 312"
            }
            +++ Section("Company Website")
            <<< TextRow(){ row in
                row.placeholder = "pearshadow.com"
            }
            <<< TextRow() { row in

            }.cellSetup({ cell, row in
                cell.height = {50.0}
                cell.addBorder(for: .bottom, withColor:UIColor(hexString: "#F1F1F5"), borderWidth: 1.0)
                cell.isUserInteractionEnabled = false
            })
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    override func viewWillLayoutSubviews() {
    
    }
    
    func setup(){
        
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

enum Border: Int {
    case top = 0
    case bottom
    case right
    case left
}

extension UIView {
    func addBorder(for side: Border, withColor color: UIColor, borderWidth: CGFloat)  {
       let borderLayer = CALayer()
       borderLayer.backgroundColor = color.cgColor

       let xOrigin: CGFloat = (side == .right ? frame.width - borderWidth : 0)
       let yOrigin: CGFloat = (side == .bottom ? frame.height - borderWidth : 0)

       let width: CGFloat = (side == .right || side == .left) ? borderWidth : frame.width
       let height: CGFloat = (side == .top || side == .bottom) ? borderWidth : frame.height

       borderLayer.frame = CGRect(x: xOrigin, y: yOrigin, width: width, height: height)
       layer.addSublayer(borderLayer)

    }
}

extension CALayer {
    func updateBorderLayer(for side: Border, withViewFrame viewFrame: CGRect) {
        let xOrigin: CGFloat = (side == .right ? viewFrame.width - frame.width : 0)
        let yOrigin: CGFloat = (side == .bottom ? viewFrame.height - frame.height : 0)

        let width: CGFloat = (side == .right || side == .left) ? frame.width : viewFrame.width
        let height: CGFloat = (side == .top || side == .bottom) ? frame.height : viewFrame.height

        frame = CGRect(x: xOrigin, y: yOrigin, width: width, height: height)
    }
}
