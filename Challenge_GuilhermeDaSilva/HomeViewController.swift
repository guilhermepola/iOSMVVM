//
//  HomeViewController.swift
//  Challenge_GuilhermeDaSilva
//
//  Created by Guilherme Pola on 29/3/17.
//  Copyright © 2017 Guilherme Pola. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func randomMusic(_ sender: UIButton) {
        callPlayerScreen()
    }
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        callPlayerScreen()
        
    }
    
    func callPlayerScreen(){
    
        let loading = LoadingView.instanceFromNib() as LoadingView
        loading.configureView()
        loading.showAnimate(duration: 2) {
            self.performSegue(withIdentifier: String(segueIdentifier: .seguePlayer), sender: nil)
            
        }
        
    }

}
