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
  var leftDiceNumber = 1
  var rightDiceNumber = 4
  override func viewDidLoad() {
    super.viewDidLoad()
    //WHO          WHAT    VALUE
    diceImageView1.image = #imageLiteral(resourceName: "DiceSix")
    diceImageView2.image = #imageLiteral(resourceName: "DiceTwo")
  }
  @IBAction func rollButtonPressed(_ sender: UIButton) {
    leftDiceNumber = leftDiceNumber == 5 ? 0 : leftDiceNumber + 1
    rightDiceNumber = 5 - leftDiceNumber
    diceImageView1.image = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")][leftDiceNumber]
    diceImageView2.image = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")][rightDiceNumber]
  }
  
}

