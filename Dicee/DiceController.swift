//
//  DiceController.swift
//  Dicee
//
//  Created by Vladimir Fibe on 04.02.2022.
//

import SwiftUI

class DiceController: UIViewController {
    
    let greenView: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView(image: UIImage(named: "GreenBackground")))
    
    let logoView: UIImageView = {
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView(image: UIImage(named: "diceeLogo")))
    
    let diceImageView1 = UIImageView(image: #imageLiteral(resourceName: "DiceOne"))
    
    let diceImageView2 = UIImageView(image: #imageLiteral(resourceName: "DiceOne"))
    lazy var diceStack = UIStackView(arrangedSubviews: [diceImageView1, diceImageView2])
    lazy var rollButton: UIButton = {
        $0.setTitle("Roll", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        $0.backgroundColor = #colorLiteral(red: 0.6078431373, green: 0.1098039216, blue: 0.1215686275, alpha: 1) // 9B1C1F
        $0.contentEdgeInsets = UIEdgeInsets(top: 10, left: 40, bottom: 10, right: 40)
        $0.layer.cornerRadius = 20
        $0.addTarget(self, action: #selector(rollButtonPressed), for: .primaryActionTriggered)
        return $0
    }(UIButton(type: .system))
    
    let dices = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    
    var dice = [UIImage(named: "DiceOne"), UIImage(named: "DiceTwo")]
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...6 {
            dice.append(UIImage(named: "Dice\(i)"))
        }
        setupUI()
        //WHO          WHAT    VALUE
        diceImageView1.image = UIImage(named: "DiceOne")
    }
    
    @objc func rollButtonPressed() {
#warning("сохранить информацию о броске в базе")
        diceStack.shake()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.diceImageView1.image = self.dices.randomElement()
            self.diceImageView2.image = self.dices[Int.random(in: 0...5)]
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            rollButtonPressed()
        }
    }
    
    func setupUI() {
        view.addSubview(greenView)
        
        diceStack.axis = .horizontal
        diceStack.alignment = .fill
        diceStack.distribution = .fill
        diceStack.spacing = 50
        
        let stack = UIStackView(arrangedSubviews: [logoView, diceStack, rollButton])
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            greenView.topAnchor.constraint(equalTo: view.topAnchor),
            greenView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

extension UIView {
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.repeatCount = 3
        animation.duration = 0.075
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        layer.add(animation, forKey: "position")
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

/*
 
 */
