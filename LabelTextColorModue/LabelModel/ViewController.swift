//
//  ViewController.swift
//  LabelModel
//
//  Created by MAC on 2017. 9. 2..
//  Copyright © 2017년 MAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var colorLabel: UILabel!
    @IBOutlet var switchMode: UISegmentedControl!
    @IBAction func changeMode(_ sender: Any) {
        setLabel()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setLabel(){
        if switchMode.selectedSegmentIndex == 0 {
            colorLabelUpdateWithRage()
        }else{
            colorLabelUpdateWithHtml()
        }
    }
    
    /**
     Color Label Update with Rage.
    */
    func colorLabelUpdateWithRage(){
        let main_string = "This is Hellow world!"
         let string_to_color = "Hellow world"
        
        // With Text.
        let range = (main_string as NSString).range(of: string_to_color)
        
        let attributedString = NSMutableAttributedString(string: main_string)
        attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.blue, range: range)
        
        // With position
        attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.red, range: NSRange(location: 0, length: 7))
        
        colorLabel.attributedText = attributedString
    }
    
    /**
     Color Label Update with Html.
    */
    func colorLabelUpdateWithHtml(){
        let htmlString = "<font color=\"red\">This is  </font> <font color=\"blue\"> Hellow word!</font>"
        
        let encodedData = htmlString.data(using: String.Encoding.utf8)!
        let attributedOptions = [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType]
        do {
            let attributedString = try NSAttributedString(data: encodedData, options: attributedOptions, documentAttributes: nil)
            colorLabel.attributedText = attributedString
            
        } catch _ {
            print("Cannot create attributed String")
        }
    }
}

