//
//  ViewController.swift
//  Counter
//
//  Created by OA on 02.05.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var reduceButton: UIButton!
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet var restartCounterButton: UIView!
    @IBOutlet weak var eventHistoryTextView: UITextView!
    private var count: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCounter()
        // Do any additional setup after loading the view.
    }
    func currentTime() -> String {
        let currentDate = Date()
        return currentDate.formatted(date: .numeric, time: .standard)
    }
    func updateCounter() {
        counterLabel.text = "Значение счетчика \(count)"
    }

    @IBAction func restartCounter() {
        count = 0
        updateCounter()
        eventHistoryTextView.insertText("\n [\(currentTime())]: значение сброшено")
    }
    @IBAction func reduceCounter() {
        if count > 0 {
            count -= 1
           updateCounter()
        eventHistoryTextView.insertText("\n [\(currentTime())]: значение изменено на -1")
        } else {
            eventHistoryTextView.insertText("\n [\(currentTime())]: попытка уменьшить значение счетчика ниже 0")
        }
    }
    
    @IBAction func increaseCounter() {
        count += 1
        updateCounter()
        eventHistoryTextView.insertText("\n [\(currentTime())]: значение изменено на +1")
    }
}

