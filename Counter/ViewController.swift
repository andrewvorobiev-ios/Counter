//
//  ViewController.swift
//  Counter
//
//  Created by Andrey Vorobev on 17.11.2025.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var counterButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    var counter: Int = 0
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCounterLabel()
        // Do any additional setup after loading the view.
    }


    @IBAction func addCounterButton(_ sender: Any) {
        addCounter()
    }
    
    @IBAction func resetСounterButton(_ sender: Any) {
        resetCounter()
    }
    
}

