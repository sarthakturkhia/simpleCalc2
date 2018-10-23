//
//  HistoryViewController.swift
//  SimpleCalciOS
//
//  Created by Sarthak Turkhia on 10/22/18.
//  Copyright © 2018 Sarthak Turkhia. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    var history:[String] = []
    var deflect: Int = 0
    override func viewDidLoad() {
        print(history)
        super.viewDidLoad()
        for item in history {
            let uiLabel: UILabel = UILabel(frame: CGRect(x: 0 , y: deflect, width: 100, height: 50))
            uiLabel.text = item
            scroller.addSubview(uiLabel)
            deflect += 50
        }
    }
    @IBOutlet weak var scroller: UIScrollView!
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
