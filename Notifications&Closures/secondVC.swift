//
//  secondVC.swift
//  Notifications&Closures
//
//  Created by Next on 26/12/16.
//  Copyright © 2016 Next. All rights reserved.
//

import UIKit

class secondVC: UIViewController {

    let k = "lokeshkumarp@helixtechsolutions.com"
    override func viewDidLoad() {
        super.viewDidLoad()

        let oneParameterAndReturnValue = { (x: Int) -> Int in
            return x % 10
        }
        print(oneParameterAndReturnValue(2))
        
        
        
        let multipleParametersAndReturnValue =
            { (first: String, second: String) -> String in
                return first + " " + second
        }
        print(multipleParametersAndReturnValue("hi","hello"))
        
        
        
        
        func sum(from: Int, to: Int, f: (Int,Int) -> (Int)) -> Int {
//            var sum = 0
//            for i in from...to {
//                sum += f(i)
//            }
//            return sum
            var sum = 0
            for i in from...to {
                sum += f(i,i+1)
            }
            return sum
        }
        
        print(sum(from: 1, to: 2) {
            $0.1
        })
        
        let add = {(first :Int) in first+first}
        print(add(2))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeColorButtonPressed(_ sender: UIButton) {
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: "COLORCHANGING"), object: nil)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
