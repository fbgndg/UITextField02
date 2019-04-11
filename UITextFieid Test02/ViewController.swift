//
//  ViewController.swift
//  UITextFieid Test02
//
//  Created by D7703_19 on 2019. 4. 4..
//  Copyright © 2019년 sin. All rights reserved.
//

import UIKit

// 1. Delegate 객체 상속
class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 3. delegate 객체와 ViewController 객체 연결
        myTextField.delegate = self
        myTextField.clearButtonMode = UITextField.ViewMode.always
        myTextField.placeholder = "숫자를 입력하세요!"
        
    }
    @IBAction func buttonPressed(_ sender: Any) {
        print(myTextField.text!)
        let inString = myTextField.text
        let outString = inString! + "Coding"
        myLabel.text = outString
        myTextField.text = "" //다음을 위하여 공백
        
        //키보드를 강제적으로 내림
        myTextField.resignFirstResponder()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        myTextField.backgroundColor = UIColor.yellow
        view.backgroundColor = UIColor.green
    }
    
    // 2. Delegate 메소드 overriding
    // called when 'return' key pressed. return NO to ignore.
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.backgroundColor = UIColor.green
        // 키패드 내리기
        myTextField.resignFirstResponder()
        return true
    }
    
    // called when clear button pressed. return NO to ignore (no notifications)
    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        myTextField.backgroundColor = UIColor.lightGray
        return true
    }
}

