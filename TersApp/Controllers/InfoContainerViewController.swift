//
//  InfoContainerViewController.swift
//  TersApp
//
//  Created by Macbook on 21. 7. 2021..
//

import UIKit
import Eureka

class InfoContainerViewController: FormViewController, ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.frame = infoContainerView.frame

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
