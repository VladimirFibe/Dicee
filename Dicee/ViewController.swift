//
//  ViewController.swift
//  Dicee
//
//  Created by Vladimir Fibe on 23.01.2022.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var diceImageView1: UIImageView!
  @IBOutlet weak var diceImageView2: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //WHO          WHAT    VALUE
    diceImageView1.image = #imageLiteral(resourceName: "DiceSix")
    diceImageView2.image = #imageLiteral(resourceName: "DiceTwo")
  }
  @IBAction func rollButtonPressed(_ sender: UIButton) {
    diceImageView1.image = #imageLiteral(resourceName: "DiceFour")
    diceImageView2.image = #imageLiteral(resourceName: "DiceFour")
    print("Button got tapped.")
  }
  
}

