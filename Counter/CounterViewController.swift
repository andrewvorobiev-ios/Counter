//
//  ViewController.swift
//  Counter
//
//  Created by Andrey Vorobev on 17.11.2025.
//

import UIKit

class CounterViewController: UIViewController {

    
    @IBOutlet weak private var counterLabel: UILabel!
    @IBOutlet weak private var counterButton: UIButton!
    @IBOutlet weak private var resetButton: UIButton!
    var counter: Int = 0
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCounterLabel()
    }

    @IBAction func addCounterButton(_ sender: Any) {
        addCounter()
    }
    @IBAction func resetСounterButton(_ sender: Any) {
        resetCounter()}
    
    func addCounter(){
        counter += 1
        updateCounterLabel()
    }
    
    func updateCounterLabel(){
        counterLabel.text = "Значение счётчика: \(counter)"
    }
    
    func resetCounter(){
        counter = 0
        updateCounterLabel()
    }
    
}

