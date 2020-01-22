//
//  ViewController.swift
//  urbanDictionary
//
//  Created by Lance Davenport on 1/20/20.
//  Copyright © 2020 Lance Davenport. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var posField: UITextField!
    @IBOutlet weak var defView: UITextView!
    
    //List and add stuff to list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func fileUrl() -> URL {
        let documentURL = try!
            FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        return documentURL.appendingPathComponent("data.json")
    }
    
    @IBAction func addWords(_ sender: UIButton) {
//        if let oldWords:[[String:String]] = getJsonData() as [[String:String]]{
//            let oldJSON =
//        }
//
      // Commented out code was stuff paul was helping me with today. Didn't get to finish
        let data: [String:String] = [
            "Name": nameField.text ?? "N/A",
            "Part of Speech": posField.text ?? "N/A",
            "Definition": defView.text ?? "N/A"
            
        ]
        let url = fileUrl()
        if let jsonData = try? JSONSerialization.data(withJSONObject: data, options: []) {
            try! jsonData.write(to: url)
            print(data)
            nameField.text = ""
            defView.text = ""
            posField.text = ""
            // Decode data first then write back to it
        } else {
            print("Failed to save")
        }
    }
    
//    func getJsonData() -> Any{
//        let url = fileUrl()
//        let responseData: Data? = try! Data(contentsOf: url)
//        if let responseData = responseData {
//            let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
//            if let dictionary: [String: Any]? = json as? [String: Any] {
//                return dictionary
//            }
//        }
//    }
//    return "[]"
//}


@IBAction func loadData(_ sender: UIButton) {
    let url = fileUrl()
    let responseData: Data? = try! Data(contentsOf: url)
    if let responseData = responseData {
        let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
        if let json = json {
            let dictionary: [String: Any]? = json as? [String: Any]
            if let dictionary = dictionary {
                for names in dictionary {
                    let name: String = dictionary["Name"] as! String
                    let definition: String = dictionary["Definition"] as! String
                    let pos: String = dictionary["Part of Speech"] as! String
                    print(name, definition, pos)
                    textView.text = ("Name: \(name) (\(pos))\n Definition: \(definition)\n ")
                }
            }
        }
    }
}



@IBAction func clearData(_ sender: UIButton) {
    let url = fileUrl()
    try? FileManager.default.removeItem(at:url)
    textView.text = ""
}


}

