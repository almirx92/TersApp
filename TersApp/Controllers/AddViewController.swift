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
        //menuContainer.addSubview(menuView)
        //menuView.delegate = self
        setup()
        form
            +++ Section("Section1")
            <<< TextRow(){ row in
                row.placeholder = "Enter text here"
            }
            
            <<< TextRow().cellSetup({ cell, row in
                row.baseCell.isUserInteractionEnabled = false
                cell.height = ({return 10.0})
            })
            // Placeholder row for the border
            <<< TextRow().cellSetup({ cell, row in
                row.baseCell.isUserInteractionEnabled = false
                cell.height = ({return 10.0})
            })
        
            +++ Section("Section1")
            <<< TextRow(){ row in
                row.placeholder = "Enter text here"
            }
            
            // Placeholder row for the border
            <<< TextRow().cellSetup({ cell, row in
                row.baseCell.isUserInteractionEnabled = false
                cell.height = ({return 10.0})
            })
            <<< TextRow().cellSetup({ cell, row in
                row.baseCell.isUserInteractionEnabled = false
                cell.height = ({return 10.0})
            })
        
            for section in form.allSections {
                let lastRow = section.allRows.last!
                lastRow.baseCell.addBorder(for: .top, withColor: .red, borderWidth: 1.0)
            }
            
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    override func viewWillLayoutSubviews() {
        //menuView.frame = menuContainer.bounds
    }
    
    func setup(){
//        formView.layer.cornerRadius = 10.0
//
//        saveBtn.layer.cornerRadius = 7
//        saveBtn.layer.backgroundColor = UIColor(hexString: "F9EC1E").cgColor
        
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
