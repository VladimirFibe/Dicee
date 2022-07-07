//
//  DiceController.swift
//  Dicee
//
//  Created by Vladimir Fibe on 04.02.2022.
//

import SwiftUI

class DiceController: UIViewController {
  
  let greenView: UIImageView = {
    $0.image = UIImage(named: "GreenBackground")
    $0.contentMode = .scaleAspectFill
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UIImageView())

  let diceImageView1 = UIImageView(image: #imageLiteral(resourceName: "DiceOne"))
  
  let diceImageView2 = UIImageView(image: #imageLiteral(resourceName: "DiceOne"))
  
  let rollButton: UIButton = {
    $0.setTitle("Roll", for: .normal)
    $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
    $0.backgroundColor = #colorLiteral(red: 0.6078431373, green: 0.1098039216, blue: 0.1215686275, alpha: 1) // 9B1C1F
    $0.contentEdgeInsets = UIEdgeInsets(top: 10, left: 40, bottom: 10, right: 40)
    $0.layer.cornerRadius = 20
    $0.addTarget(nil, action: #selector(rollButtonPressed), for: .touchUpInside)
    return $0
  }(UIButton(type: .system))
  
  let dices = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    //WHO          WHAT    VALUE
    diceImageView1.image = #imageLiteral(resourceName: "DiceSix")
  }
  
  @objc func rollButtonPressed() {
    diceImageView1.image = dices.randomElement()
    diceImageView2.image = dices[Int.random(in: 0...5)]
  }
  
  override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    if motion == .motionShake {
      rollButtonPressed()
    }
  }
  
  func setupUI() {
    view.addSubview(greenView)
    NSLayoutConstraint.activate([
      greenView.topAnchor.constraint(equalTo: view.topAnchor),
      greenView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ])

    let diceStack = UIStackView(arrangedSubviews: [diceImageView1, diceImageView2])
    diceStack.axis = .horizontal
    diceStack.alignment = .fill
    diceStack.distribution = .fill
    diceStack.spacing = 50
    
    let stack = UIStackView(arrangedSubviews: [diceStack, rollButton])
    stack.axis = .vertical
    stack.alignment = .center
    stack.distribution = .fill
    stack.spacing = 70
    stack.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(stack)
    NSLayoutConstraint.activate([
      stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      stack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
  }
}

struct SwiftUIController: UIViewControllerRepresentable {
  typealias UIViewControllerType = DiceController
  
  func makeUIViewController(context: Context) -> UIViewControllerType {
    let viewController = UIViewControllerType()
    return viewController
  }
  
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    
  }
}

struct SwiftUIController_Previews: PreviewProvider {
  static var previews: some View {
    SwiftUIController()
      .edgesIgnoringSafeArea(.all)
  }
}
