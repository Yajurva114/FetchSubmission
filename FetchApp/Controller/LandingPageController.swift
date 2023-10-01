//
//  LandingPageController.swift
//  FetchApp
//
//  Created by yajurva shrotriya on 9/30/23.
//

import UIKit

class LandingPageController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.cornerRadius = button.frame.height / 2

        // Do any additional setup after loading the view.
    }
    
    //Function to load the next View controller.
    @IBAction func loadData(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ListPageController") as! ListPageController
        vc.modalPresentationStyle = .fullScreen
        
        present(vc, animated: true)
    }

}
