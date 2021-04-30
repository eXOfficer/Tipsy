//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Justdream on 30/04/2021.
//  Copyright © 2021 Justdreams. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
        
    var numOfPeople = 0
    var tip = 0
    var finalResult = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = finalResult
        settingsLabel.text = "Split between \(numOfPeople) people with \(tip)% tip"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
