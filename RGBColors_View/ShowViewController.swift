//
//  ViewController.swift
//  RGBColors_View
//
//  Created by Artur on 19.11.2022.
//

import UIKit

class ShowViewController: UIViewController {

    weak var delegate: ShowViewControllerDelegate?
    
    @IBOutlet var mainView: UIView!
    
    //MARK: Labels
    @IBOutlet var redColorLabel: UILabel!
    @IBOutlet var greenColorLabel: UILabel!
    @IBOutlet var blueColorLabel: UILabel!
    @IBOutlet var alphaColorLabel: UILabel!
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    @IBOutlet var alphaValueLabel: UILabel!
    @IBOutlet var enableLabel: UILabel!
    
    //MARK: TextFields
    @IBOutlet var redTextFieldLabel: UITextField!
    @IBOutlet var greenTextFieldLabel: UITextField!
    @IBOutlet var blueTextFieldLabel: UITextField!
    @IBOutlet var alphaTextFieldLabel: UITextField!
    
    //MARK: Sliders
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var alphaSlider: UISlider!
    
    @IBOutlet var enableSwitch: UISwitch!
    
    var currentColor: UIColor = .white
    var ciCurrentColor: CIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        setupView()
        setupSliders()
        changeStartTextValueLabel()
        setupLabels()
        setupTextFields()
        setupSwitch()
    }
    
    private func setupView() {
        //MARK: View
//        redTextFieldLabel.delegate = self
//        greenTextFieldLabel.delegate = self
//        blueTextFieldLabel.delegate = self
        redTextFieldLabel.addTarget(nil, action: #selector(changeValue), for: .editingChanged)
        redTextFieldLabel.keyboardType = .numberPad
        mainView.backgroundColor = currentColor
        mainView.layer.cornerRadius = 15
    }
    
    private func setupSliders() {
        //MARK: Setup Sliders
        //ciCurrentColor = CIColor(color: currentColor)
        redSlider.minimumValue = 1
        redSlider.maximumValue = 255
        redSlider.value = Float(ciCurrentColor.red) * 255
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumValue = 1
        greenSlider.maximumValue = 255
        greenSlider.value = Float(ciCurrentColor.green) * 255
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumValue = 1
        blueSlider.maximumValue = 255
        blueSlider.value = Float(ciCurrentColor.blue) * 255
        blueSlider.minimumTrackTintColor = .blue
        alphaSlider.value = Float(ciCurrentColor.alpha)
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
    }
    
    private func setupTextFields(){
        redTextFieldLabel.text = String(Int(ciCurrentColor.red * 255))
        greenTextFieldLabel.text = String(Int(ciCurrentColor.green * 255))
        blueTextFieldLabel.text = String(Int(ciCurrentColor.blue * 255))
        alphaTextFieldLabel.text = String(Int(ciCurrentColor.alpha))
    }
    
    private func setupSwitch() {
        //MARK: Switch
        enableSwitch.isOn = false
        hideAction()
    }
    
    private func changeColorView(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        //MARK: Change Color
        mainView.backgroundColor = UIColor(
            red: CGFloat(red)/255,
            green: CGFloat(green)/255,
            blue: CGFloat(blue)/255,
            alpha: CGFloat(alpha))
        currentColor = UIColor(
            red: CGFloat(red)/255,
            green: CGFloat(green)/255,
            blue: CGFloat(blue)/255,
            alpha: CGFloat(alpha))
    }
    
    private func changeColorViewOnTextField(_ textField: UITextField) {
        guard let value = Int(textField.text!) else { return }
        switch textField.tag {
        case 0:
            redSlider.setValue(Float(value), animated: true)
            changeColorView(red: CGFloat(value),
                            green: CGFloat(greenSlider.value),
                            blue: CGFloat(blueSlider.value),
                            alpha: CGFloat(alphaSlider.value))
        case 1:
            greenSlider.setValue(Float(value), animated: true)
            changeColorView(red: CGFloat(redSlider.value),
                            green: CGFloat(value),
                            blue: CGFloat(blueSlider.value),
                            alpha: CGFloat(alphaSlider.value))
        case 2:
            blueSlider.setValue(Float(value), animated: true)
            changeColorView(red: CGFloat(redSlider.value),
                            green: CGFloat(greenSlider.value),
                            blue: CGFloat(value),
                            alpha: CGFloat(alphaSlider.value))
        case 3:
            changeColorView(red: CGFloat(redSlider.value),
                            green: CGFloat(greenSlider.value),
                            blue: CGFloat(blueSlider.value),
                            alpha: CGFloat(value))
        default:
            break
        }
    }
    
    private func changeStartTextValueLabel() {
        //MARK: Value to Sliders On Start View
        redValueLabel.text = "\(Int(ciCurrentColor.red * 255))"
        greenValueLabel.text = "\(Int(ciCurrentColor.green * 255))"
        blueValueLabel.text = "\(Int(ciCurrentColor.blue * 255))"
        alphaValueLabel.text = "\(Int(ciCurrentColor.alpha))"
    }
    
    private func changeTextValueLabel(_ sender: UISlider) {
        //MARK: Value on Sliders
        switch sender.tag {
        case 0:
            redValueLabel.text = "\(Int(sender.value))"
        case 1:
            greenValueLabel.text = "\(Int(sender.value))"
        case 2:
            blueValueLabel.text = "\(Int(sender.value))"
        case 3:
            alphaValueLabel.text = "\(Int(sender.value))"
        default: break
        }
    }
    
    private func changeTextFieldsValue(_ sender: UISlider) {
        //MARK: Value on TextFields
        switch sender.tag {
        case 0:
            redTextFieldLabel.text = "\(Int(sender.value))"
        case 1:
            greenTextFieldLabel.text = "\(Int(sender.value))"
        case 2:
            blueTextFieldLabel.text = "\(Int(sender.value))"
        case 3:
            alphaTextFieldLabel.text = "\(Int(sender.value))"
        default: break
        }
    }
    
    @IBAction func changeRGBAuction(_ sender: UISlider) {
        //MARK: Slider Auctions
        changeTextValueLabel(sender)
        changeTextFieldsValue(sender)
        changeColorView(red: CGFloat(redSlider.value),
                        green: CGFloat(greenSlider.value),
                        blue: CGFloat(blueSlider.value),
                        alpha: CGFloat(alphaSlider.value))
    }
    
    @IBAction func hideAction() {
        //MARK: Hide ALL
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
            alphaValueLabel,
        ].forEach({ $0.isHidden = !enableSwitch.isOn })
        
        [
            redTextFieldLabel,
            greenTextFieldLabel,
            blueTextFieldLabel,
            alphaTextFieldLabel
        ].forEach({ $0?.isHidden = !enableSwitch.isOn })
        
        enableLabel.text = enableSwitch.isOn ? "Выключить" : "Включить"
    }
    
    
    @IBAction func onDoneAction(_ sender: Any) {
        delegate?.newBackgroundColorForView(color: currentColor)
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc
    private func changeValue() {
//        guard let value = redTextFieldLabel.text,
//        else { return }
        
        if let text = redTextFieldLabel.text {
            redSlider.value = NSString(string: text).floatValue
        }
        


    }
}

//extension ShowViewController: UITextFieldDelegate {
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        changeColorViewOnTextField(textField)
//    }
//}

/*
 
 */
