//
//  ViewController.swift
//  EventHub
//
//  Created by Claudia Vanta on 22.11.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapButton() {
        showAlert()
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "title", message: "message", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "dismiss", style: .cancel, handler: {
            action in print("tapped dismiss")
        }))
        present(alert, animated: true)
    }
}
