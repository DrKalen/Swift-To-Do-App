//
//  SecondViewController.swift
//  To Do App
//
//  Created by Kalen Hammann on 12/8/18.
//  Copyright © 2018 Human Family. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var itemTextField: UITextField!
    
    @IBAction func saveButton(_ sender: Any) {
        let toDosObject = UserDefaults.standard.object(forKey: "toDos")
        var toDos = toDosObject as? [String] ?? [String]()
        toDos.append(itemTextField.text ?? "")
        UserDefaults.standard.set(toDos, forKey: "toDos")
        itemTextField.text = ""
        print(toDos)
    }
    
    @IBAction func eraseAllItemsButton(_ sender: Any) {
        UserDefaults.standard.set(nil, forKey: "toDos")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
