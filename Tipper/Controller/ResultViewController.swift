//
//  ResultViewController.swift
//  Tipper
//
//  Created by Siddhant Jayant Angore on 14/10/19.
//  Copyright © 2019 Siddhant Jayant Angore. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    
    @IBOutlet weak var amountPerPerson: UILabel!
    @IBOutlet weak var detailsOfTip: UILabel!
    
    //MARK: variables
    var result = "0.0"
    var split = 2
    var tip = 10
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        amountPerPerson.text = result
        detailsOfTip.text = "Split between \(split) people, with \(tip)% tip."
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
