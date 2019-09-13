//
//  ViewController.swift
//  Slider
//
//  Created by MyGlamm on 9/13/19.
//  Copyright © 2019 MyGlamm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let image = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1).image()
        let image2 = makeCircleWith(imageSize: 70, backgroundColor: .red)
        slider.setThumbImage(image2, for: .normal)
        
        }

    
    
    fileprivate func makeCircleWith(imageSize: Int, backgroundColor: UIColor) -> UIImage? {
        
        let size = CGSize(width: imageSize, height: imageSize)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()
        //context?.setFillColor(backgroundColor.cgColor)
      //  context?.setStrokeColor(UIColor.blue.cgColor)
        
        //change the divider to change the border width
        let borderWidth = imageSize/10
        
        let circelWidthNHeight = (imageSize - (borderWidth * 2))
        
        let bounds = CGRect(x: borderWidth, y: borderWidth, width: circelWidthNHeight, height: circelWidthNHeight)
        
        //let bounds = CGRect(origin: .zero, size: CGSize(width: size.width - 10, height: size.height - 10))
       // context?.addEllipse(in: bounds)
       // context?.drawPath(using: .fill)
       
        
        let circularPath = UIBezierPath(ovalIn: bounds)
        #colorLiteral(red: 1, green: 0.5921568627, blue: 0.5921568627, alpha: 1).setFill()
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setStroke()
        circularPath.lineWidth = CGFloat(borderWidth)
        circularPath.fill()
        
        context?.addPath(circularPath.cgPath)
        circularPath.stroke()
        
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    

}



extension UIColor {
    func image(_ size: CGSize = CGSize(width: 10, height: 10)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}


