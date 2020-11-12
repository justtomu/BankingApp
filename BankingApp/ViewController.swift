//
//  ViewController.swift
//  BankingApp
//
//  Created by Bogdan Skvorchevsky on 12.11.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var AmountLabel: UILabel?
    @IBOutlet weak var CreditAmountLabel: UILabel?
    @IBOutlet weak var pvTextField: UITextField?
    @IBOutlet weak var npeerTextField: UITextField?
    @IBOutlet weak var rateTextField: UITextField!
    
    var amount: Double = 0 {
        didSet {
            UpdateAmountLabel()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func UpdateAmountLabel(){
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "₽"
//        let number = NSNumber(value: amount)
        AmountLabel?.text = formatter.string(from: NSNumber(value: amount))
    }
    
    func UpdateCreditAmount(){
        CreditAmountLabel?.text = nil
        guard let pv = Double(pvTextField?.text ?? "") else { return }
        guard let npeer = Double(npeerTextField?.text ?? "") else { return }
        guard let rate = Double(rateTextField?.text ?? "") else { return }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "₽"
        
//        let CreditAmount = pv + npeer + rate
        let CreditAmount = abs(ExcelFormulas.pmt(rate: rate/100/12, nper: npeer, pv: pv))
        CreditAmountLabel?.text = formatter.string(from: NSNumber(value: CreditAmount))
//        CreditAmountLabel?.text = String(CreditAmount)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UpdateCreditAmount()
        UpdateAmountLabel()
        
        amount += 1.99
    }

    @IBAction func TextFieldEdditingChange(_ sender: UITextField) {
        UpdateCreditAmount()
    }
    
}

