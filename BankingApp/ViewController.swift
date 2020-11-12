//
//  ViewController.swift
//  BankingApp
//
//  Created by Bogdan Skvorchevsky on 12.11.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var amount_label: UILabel!
    
    var amount: Double = 0 {
        didSet {
            UpdeateAmountLabel()
        }
    }
    
    func UpdeateAmountLabel(){
        amount_label.text = String(amount)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UpdeateAmountLabel()
        
//        amount += 1.99
    }


}

