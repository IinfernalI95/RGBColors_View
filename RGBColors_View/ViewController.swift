//
//  ViewController.swift
//  RGBColors_View
//
//  Created by Artur on 19.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    
    @IBOutlet var redColorLabel: UILabel!
    @IBOutlet var greenColorLabel: UILabel!
    @IBOutlet var blueColorLabel: UILabel!
    @IBOutlet var alphaColorLabel: UILabel!
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    @IBOutlet var alphaValueLabel: UILabel!
    @IBOutlet var enableLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var alphaSlider: UISlider!
    
    @IBOutlet var enableSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupSliders()
        setupLabels()
        setupSwitch()
    }
    
    fileprivate func setupView() {
        //MARK: View
        mainView.backgroundColor = UIColor(red: 1/255, green: 1/255, blue: 1/255, alpha: 1.0)
        mainView.layer.cornerRadius = 15
    }
    
    private func setupSliders() {
        //MARK: Sliders
        redSlider.value = 1
        redSlider.minimumValue = 1
        redSlider.maximumValue = 255
        redSlider.minimumTrackTintColor = .red
        greenSlider.value = 1
        greenSlider.minimumValue = 1
        greenSlider.maximumValue = 255
        greenSlider.minimumTrackTintColor = .green
        blueSlider.value = 1
        blueSlider.minimumValue = 1
        blueSlider.maximumValue = 255
        blueSlider.minimumTrackTintColor = .blue
        alphaSlider.value = 1
        alphaSlider.minimumValue = 0
        alphaSlider.maximumValue = 1
        alphaSlider.minimumTrackTintColor = .lightGray.withAlphaComponent(0.05)
        alphaSlider.maximumTrackTintColor = .lightGray
    }
    
    private func setupLabels() {
        //MARK: Labels
        redColorLabel.text = "RED:"
        greenColorLabel.text = "GREEN:"
        blueColorLabel.text = "BLUE:"
        alphaColorLabel.text = "APLHA:"
        redValueLabel.text = "1"
        blueValueLabel.text = "1"
        greenValueLabel.text = "1"
        alphaValueLabel.text = "1"
    }
    
    private func setupSwitch() {
        //MARK: Switch
        enableSwitch.isOn = false
        hideAction()
    }
    
    private func changeColorView() {
        mainView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value)/255,
            green: CGFloat(greenSlider.value)/255,
            blue: CGFloat(blueSlider.value)/255,
            alpha: CGFloat(alphaSlider.value))
    }
    
    @IBAction func changeRedAction(_ sender: Any) {
        redValueLabel.text = "\(Int(redSlider.value))"
        changeColorView()
    }
    
    @IBAction func changeGreenAction(_ sender: Any) {
        greenValueLabel.text = "\(Int(greenSlider.value))"
        changeColorView()
    }
    
    @IBAction func changeBlueAction(_ sender: Any) {
        blueValueLabel.text = "\(Int(blueSlider.value))"
        changeColorView()
    }
    
    @IBAction func changeAlphaAction(_ sender: Any) {
        alphaValueLabel.text = "\(Int(alphaSlider.value))"
        changeColorView()
    }
    
    @IBAction func hideAction() {
        [
            mainView,
            redColorLabel,
            greenColorLabel,
            blueColorLabel,
            alphaColorLabel,
            redSlider,
            greenSlider,
            blueSlider,
            alphaSlider,
            redValueLabel,
            greenValueLabel,
            blueValueLabel,
            alphaValueLabel
        ].forEach({ $0.isHidden = !enableSwitch.isOn })
        
        enableLabel.text = enableSwitch.isOn ? "Выключить" : "Включить"
    }
}

