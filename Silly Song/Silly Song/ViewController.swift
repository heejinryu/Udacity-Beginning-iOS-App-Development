//
//  ViewController.swift
//  Silly Song
//
//  Created by HEEJIN RYU on 9/11/16.
//  Copyright © 2016 HEEJIN RYU. All rights reserved.
//

import UIKit

// MARK: - UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}


class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func reset(sender: AnyObject) {
        nameField.text = ""
        lyricsView.text = ""
    }

    @IBAction func displayLyrics(sender: AnyObject) {
        if let name = nameField.text {
            lyricsView.text = lyricsForName(bananaFanaTemplate, fullName: name)
        }
    }
}


func shortNameFromName(fullName: String) -> String {
    let lowerCaseName = fullName.lowercaseString
    let vowel = NSCharacterSet(charactersInString: "aeiou")
    if let firstVowelName = lowerCaseName.rangeOfCharacterFromSet(vowel, options: .CaseInsensitiveSearch) {
        return lowerCaseName.substringFromIndex(firstVowelName.startIndex)
    }
    return lowerCaseName
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joinWithSeparator("\n")

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let shortName = shortNameFromName(fullName)
    
    let lyrics = lyricsTemplate
        .stringByReplacingOccurrencesOfString("<FULL_NAME>", withString: fullName)
        .stringByReplacingOccurrencesOfString("<SHORT_NAME>", withString: shortName)
    
    return lyrics
}

