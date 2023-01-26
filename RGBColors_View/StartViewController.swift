//
//  StartViewController.swift
//  RGBColors_View
//
//  Created by Artur on 28.12.2022.
//

import UIKit
//MARK: Delegate
protocol ShowViewControllerDelegate: AnyObject {
    func newBackgroundColorForView(color: UIColor)
}

class StartViewController: UIViewController {
    var currentColor: UIColor = .darkGray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = currentColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let showVC = segue.destination as! ShowViewController
        showVC.currentColor = currentColor
        showVC.ciCurrentColor = CIColor(color: currentColor)
        showVC.delegate = self
    }
    
    @IBAction func unwindToMainScreen(segue: UIStoryboardSegue){
    }
    
}

extension StartViewController: ShowViewControllerDelegate {
    func newBackgroundColorForView(color: UIColor) {
        currentColor = color
        view.backgroundColor = color
    }
}
