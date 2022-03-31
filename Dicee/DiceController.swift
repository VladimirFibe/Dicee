//
//  DiceController.swift
//  Dicee
//
//  Created by Vladimir Fibe on 04.02.2022.
//

import SwiftUI

class DiceController: UIViewController {
  
  let greenView: UIImageView = {
    let image = UIImageView(image: UIImage(named: "GreenBackground"))
    image.contentMode = .scaleAspectFill
    return image
  }()

  let diceImageView1 = UIImageView(image: #imageLiteral(resourceName: "DiceOne"))
  
  let diceImageView2 = UIImageView(image: #imageLiteral(resourceName: "DiceOne"))
  
  let rollButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Roll", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
    button.backgroundColor = #colorLiteral(red: 0.6078431373, green: 0.1098039216, blue: 0.1215686275, alpha: 1) // 9B1C1F
    button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 40, bottom: 10, right: 40)
    button.layer.cornerRadius = 20
    button.addTarget(nil, action: #selector(rollButtonPressed), for: .touchUpInside)

    return button
  }()
  
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
    view.addSubview(diceImageView1)
    view.addSubview(diceImageView2)
    view.addSubview(rollButton)
    let diceStack = UIStackView(arrangedSubviews: [diceImageView1, diceImageView2])
    diceStack.axis = .horizontal
    diceStack.alignment = .fill
    diceStack.distribution = .fill
    diceStack.spacing = 60
    
    let stack = UIStackView(arrangedSubviews: [diceStack, rollButton])
    stack.axis = .vertical
    stack.alignment = .center
    stack.distribution = .fill
    stack.spacing = 80
    
    view.addSubview(stack)
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    greenView.translatesAutoresizingMaskIntoConstraints = false
    greenView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    greenView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
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
