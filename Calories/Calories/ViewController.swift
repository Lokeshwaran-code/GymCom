//
//  ViewController.swift
//  Calories
//
//  Created by LOKESH on 04/03/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var wt: UITextField!
    @IBOutlet var ht: UITextField!
    @IBOutlet var age: UITextField!
    
    @IBOutlet var lbl: UILabel!
    
    
    @IBOutlet var bnt: UIButton!
    
    @IBOutlet var seg: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        bnt.addTarget(self, action: #selector(calculateButtonTapped(_:)), for: .touchUpInside)

    }
    
    @IBAction func calculate(_ sender: Any)
    {
        
        
    }
    
//    
//    @IBAction func seg(_ sender: Any)
//    {
//
//    }
    @objc func calculateButtonTapped(_ sender: UIButton) {
          // Call the BMI calculation function
        cal_calories()
      }
    
//    @objc func seg(_ sender: UISegmentedControl) {
//          // Handle segment change
//        cal_calories()
//    }
    
    func male(hts: Double, wts: Double, ag: Double) -> Double
    {
//        let wt_value = Float(wt.text!)
//        let ht_value = Float(ht.text!)
//        let age_value = Float(age.text!)
//        
        let a = 13.397 * wts
        let b = 4.799 * hts
        let c = 5.677 * ag
        
        let bmr = 88.362 + a + b - c
        let f_bmr = Int(bmr)
//        
//        
//        lbl.text = String(f_bmr)
        
        
        return Double(f_bmr)
        
    }
    
    // male = 88.361 + (13.397 X wt) + (4.799 X ht) - (5.677 X age)
    // female = 447.593 + (9.247 × weight in kg) + (3.098 × height in cm) - (4.330 × age in years)
    func female(hts: Double, wts: Double, ag: Double) -> Double
    {
        let a = 9.247
        let b = 3.098
        let c = 4.330
        
        let bmr = 447.593 + a + b - c
        let f_bmr = Int(bmr)
        
        return Double(f_bmr)
    }
    
    func cal_calories() {
            guard let heightText = wt.text,
                  let height = Double(heightText),
                  
                  let weightText = ht.text,
                  let weight = Double(weightText),
                  
                  let ages = age.text,
                  let ags = Double(ages)
        else {
                lbl.text = "Please enter valid height and weight"
                return
            }
            
            if seg.selectedSegmentIndex == 0 {
                // Calculate BMI for Male
                let bmi = male(hts: height, wts: weight, ag: ags)
                lbl.text = "Male BMI: \(bmi)"
            } else {
                // Calculate BMI for Female
                let bmi = female(hts: height, wts: weight, ag: ags)
                lbl.text = "Female BMI: \(bmi)"
            }
        }
    
}

