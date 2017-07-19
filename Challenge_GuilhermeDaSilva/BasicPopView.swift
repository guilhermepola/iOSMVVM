//
//  BasicPopView.swift
//  Challenge_GuilhermeDaSilva
//
//  Created by Guilherme Pola on 29/3/17.
//  Copyright © 2017 Guilherme Pola. All rights reserved.
//

import UIKit

class BasicPopView: UIView {

    class func instanceFromNib<T: UIView>() -> T {
        
        let view = Bundle.main.loadNibNamed(
            String(describing: T.self), owner:self, options:nil)?
            .first as! T
        let win:UIWindow = UIApplication.shared.delegate!.window!!
        
        view.frame = CGRect(x: 0, y: 0, width: win.frame.size.width, height: win.frame.size.height)
        win.addSubview(view)
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return view
    }
    
    

    func showAnimate(duration: Int? = nil, completion : @escaping (() -> Void))
    {
        
        self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        self.alpha = 0.0;
        UIView.animate(withDuration: 0.26, animations: {
            self.alpha = 1.0
            self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)

        });

        
        if let duration = duration{
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(duration)) {
            self.removeAnimate()
            completion()

            }
        }
        
    }

    
    func removeAnimate()
    {
        
        
        UIView.animate(withDuration: 0.26, animations: {
            self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            self.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.removeFromSuperview()
                
                
            }
        });
    }


}
