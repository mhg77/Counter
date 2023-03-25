//
//  ViewController.swift
//  Counter
//
//  Created by Михаил Асаилов on 25.03.2023.
//

import UIKit

class ViewController: UIViewController {

    private var userCount: Int = 0
    
    @IBOutlet weak var countButtonMinus: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var historyTextView: UITextView!
    @IBOutlet weak var countButtonPlus: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        historyTextView.isEditable = false
    }
    
    func currentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH.mm.ss"
        return dateFormatter.string(from: Date())
    }
    
    func appendHistory(message: String) {
            let historyMessage = "\n\(currentDate()): \(message)\n"
            historyTextView.text.append(historyMessage)
            historyTextView.scrollRangeToVisible(NSRange(location: historyTextView.text.count, length: 0))
        }

        @IBAction func buttonDidTapPlus(_ sender: Any) {
            userCount += 1
            countLabel.text = "\(userCount)"
            appendHistory(message: "значение изменено на +1")
        }
        
        @IBAction func buttonDidTapMinus(_ sender: Any) {
            if userCount == 0 {
                return
            } else {
                userCount -= 1
                countLabel.text = "\(userCount)"
                appendHistory(message: "значение изменено на -1")
            }
        }
        
        @IBAction func buttonDidTapReset(_ sender: Any) {
            if userCount == 0 {
                return
            } else {
                userCount = 0
                countLabel.text = "0"
                appendHistory(message: "значение сброшено")
            }
    }
}

