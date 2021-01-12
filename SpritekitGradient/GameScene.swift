//
//  GameScene.swift
//  SpritekitGradient
//
//  Created by Artturi Jalli on 12.1.2021.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let color1: CGColor = UIColor(red: 209/255, green: 107/255, blue: 165/255, alpha: 1).cgColor
    let color2: CGColor = UIColor(red: 134/255, green: 168/255, blue: 231/255, alpha: 1).cgColor
    let color3: CGColor = UIColor(red: 95/255, green: 251/255, blue: 241/255, alpha: 1).cgColor
    
    let startPoint = CGPoint(x: 0.5, y: 1)
    let endPoint = CGPoint(x: 0.5, y: 0)
    
    override func didMove(to view: SKView) {
        
        let image: UIImage = UIImage.gradientImage(withBounds: self.frame, startPoint: startPoint, endPoint: endPoint, colors: [color1, color2, color3])
        let gradientTexture = SKTexture(image: image)
        let gradientNode = SKSpriteNode(texture: gradientTexture)
        
        self.addChild(gradientNode)
    }
}

extension UIImage {
    static func gradientImage(withBounds: CGRect, startPoint: CGPoint, endPoint: CGPoint , colors: [CGColor]) -> UIImage {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = withBounds
        gradientLayer.colors = colors
        
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}
