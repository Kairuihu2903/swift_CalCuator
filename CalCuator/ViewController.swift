//
//  ViewController.swift
//  CalCuator
//
//  Created by Kairui Hu on 3/2/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblOutlet: UILabel!
    
    var myCalc_model = Calc_model()
    
    var formula: String = ""
    var lastop: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    // does number clicks
    
    @IBAction func btnNmberClick(_ sender: UIButton){
        
        guard let value = sender.titleLabel?.text else{return}
        guard var strOut = lblOutlet.text else{ return }
        
        strOut = myCalc_model.btnNumberClick(val: value,str: strOut)
        lblOutlet.text = strOut
    }
    
    
    
    // clears screen
    @IBAction func btnClearClick(_ sender: UIButton)
    {
        
        //myCalc_model.formula = ""
        guard var strOut = lblOutlet.text else {return}
        strOut = myCalc_model.btnClearClick(str: strOut)
        lblOutlet.text = strOut
    }
    
    
    
    // does negative to poitive
    @IBAction func btnSignClick(_ sender: UIButton)
    {
        guard var strOut = lblOutlet.text else {return}
        strOut = myCalc_model.btnSignClick(str: strOut)
        lblOutlet.text = strOut
    /*
        if strOut == "0"
        {
            return
        }
        if strOut.first == "!"
        {
            strOut.removeFirst()
            lblOutlet.text = strOut
        }
        else
        {
            strOut = "!" + strOut
            lblOutlet.text = strOut
        }
        print(formula)
     */
    }
    
    
    
    // does divide by 100
    @IBAction func btnmodSign(_ sender: UIButton)
    {
        guard var strOut = lblOutlet.text else {return}
        strOut = myCalc_model.btnmodSign(str: strOut)
        lblOutlet.text = strOut
        
        /*
        guard var value = Double(strOut) else {return}
        value = value / 100
        strOut = String(value)
         lblOutlet.text = strOut
         */
    }
    
    
    //@IBAction func btnBackSpace(_ sender: UIButton)
    //{
    //    guard var strOut = lblOutlet.text else {return}
    //    if strOut.count > 0
    //    {
    //        strOut = String(strOut.dropLast())
    //        lblOutlet.text = strOut
    //    }
    //    formula = strOut
    //    print(formula)
    //}

    
    @IBAction func divideTap(_ sender: Any)
    {
        guard var strOut = lblOutlet.text else {return}
        lblOutlet.text = ""
        var newstrOut = myCalc_model.dividetap(str: strOut, lastOp: lastop, Formula: formula)
        
        strOut = newstrOut.str
        formula = newstrOut.Formula
        lastop = newstrOut.lastOp
        
        
        
        
        /*
        if (lastop == "/" && strOut == "0")
        {
            print("invalid")
        }
        
        else{
            if (strOut == "")
            {
                formula = String(formula.dropLast())
                formula += "/"

            }
            else
            {
                formula += strOut + "/"
                lblOutlet.text = ""
            }
            print(formula)
            lastop = "/"
        }*/
         
    }
    
    @IBAction func MultiplyTap(_ sender: Any)
    {
        guard var strOut = lblOutlet.text else {return}
        lblOutlet.text = ""
        var newstrOut = myCalc_model.multiplytap(str: strOut, lastOp: lastop, Formula: formula)
        
        strOut = newstrOut.str
        formula = newstrOut.Formula
        lastop = newstrOut.lastOp
        
        
        /*
        if (lastop == "/" && strOut == "0")
        {
            print("invalid")
        }
        else{
            if (strOut == "")
            {
                formula = String(formula.dropLast())
                formula += "*"

            }
            else
            {
                formula += strOut + "*"
                lblOutlet.text = ""
            }
            print(formula)
            lastop = "*"
        }
         */
    }
    
    @IBAction func subtractTap(_ sender: Any) {
        guard var strOut = lblOutlet.text else {return}
        lblOutlet.text = ""
        var newstrOut = myCalc_model.subtracttap(str: strOut, lastOp: lastop, Formula: formula)
        
        strOut = newstrOut.str
        formula = newstrOut.Formula
        lastop = newstrOut.lastOp
        
        /*
        if (lastop == "/" && strOut == "0")
        {
            print("invalid")
        }
        else{
            if (strOut == "")
            {
                formula = String(formula.dropLast())
                formula += "-"

            }
            else
            {
                formula += strOut + "-"
                lblOutlet.text = ""
            }
            print(formula)
            lastop = "-"
        }
         */
    }
    
    @IBAction func addTap(_ sender: Any) {
        guard var strOut = lblOutlet.text else {return}
        lblOutlet.text = ""
        var newstrOut = myCalc_model.addtap(str: strOut, lastOp: lastop, Formula: formula)
        
        strOut = newstrOut.str
        formula = newstrOut.Formula
        lastop = newstrOut.lastOp
        /*
        if (lastop == "/" && strOut == "0")
        {
            print("invalid")
        }
        else{
            if (strOut == "")
            {
                formula = String(formula.dropLast())
                formula += "+"

            }
            else
            {
                formula += strOut + "+"
                lblOutlet.text = ""
            }
            print(formula)
            lastop = "+"
        }
         */
    }
    
    @IBAction func equalTap(_ sender: Any) {
        guard var strOut = lblOutlet.text else {return}

        var newstrOut = myCalc_model.equaltap(str: strOut, lastOp: lastop, Formula: formula)
        strOut = newstrOut.str
        formula = newstrOut.Formula
        lastop = newstrOut.lastOp
        lblOutlet.text = strOut
        
        
    }
}
