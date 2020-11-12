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
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "₽"
//        let number = NSNumber(value: amount)
        amount_label.text = formatter.string(from: NSNumber(value: amount))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UpdeateAmountLabel()
        
//        amount += 1.99
    }


}

