//
//  ViewController.swift
//  Counter
//
//  Created by Михаил Асаилов on 25.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var userCount: Int = 0
    
    @IBOutlet private weak var countButtonMinus: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    @IBOutlet private weak var historyTextView: UITextView!
    @IBOutlet private weak var countButtonPlus: UIButton!
    @IBOutlet private weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        historyTextView.isEditable = false
    }
    
    private func currentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH.mm.ss"
        return dateFormatter.string(from: Date())
    }
    
    private func appendHistory(message: String) {
        let historyMessage = "\n\(currentDate()): \(message)\n"
        historyTextView.text.append(historyMessage)
        historyTextView.scrollRangeToVisible(NSRange(location: historyTextView.text.count, length: 0))
    }
    
    @IBAction private func buttonDidTapPlus(_ sender: Any) {
        userCount += 1
        countLabel.text = "\(userCount)"
        appendHistory(message: "значение изменено на +1")
    }
    
    @IBAction private func buttonDidTapMinus(_ sender: Any) {
        if userCount == 0 {
            countLabel.text = "\(userCount)"
            appendHistory(message: "попытка уменьшить значение счётчика ниже 0")
        } else {
            userCount -= 1
            countLabel.text = "\(userCount)"
            appendHistory(message: "значение изменено на -1")
        }
    }
    
    @IBAction private func buttonDidTapReset(_ sender: Any) {
        if userCount == 0 {
            return
        } else {
            userCount = 0
            countLabel.text = "0"
            appendHistory(message: "значение сброшено")
        }
    }
}

