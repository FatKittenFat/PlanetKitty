//
//  RegisterViewController.swift
//  PlanetKitty
//
//  Created by Fatima Ramirez on 16/07/24.
//

import UIKit

class RegisterViewController: UIViewController {
    
    private let background: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "loginBackground.png")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let tittleLabel: UILabel = {
        let label = UILabel()
        label.text = "Crea una nueva cuenta"
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Futura", size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let nameTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "  Nombre"
        textfield.borderStyle = .none
        textfield.layer.cornerRadius = 15.0
        textfield.backgroundColor = .white
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    private let lastNameFTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "  Apellido Paterno"
        textfield.borderStyle = .none
        textfield.layer.cornerRadius = 15.0
        textfield.backgroundColor = .white
        //UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    private let lastNameMTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "  Apellido Materno"
        textfield.borderStyle = .none
        textfield.layer.cornerRadius = 15.0
        textfield.backgroundColor = .white
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    private let dateTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "  Fecha de nacimiento"
        text.tintColor = .clear
        text.layer.cornerRadius = 15.0
        text.backgroundColor = .white
        text.translatesAutoresizingMaskIntoConstraints = false
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.frame = CGRect(x: 20, y: 20, width: -40, height: 300)
        
        
        datePicker.addTarget(self, action: #selector(datePickerValue(_:)), for: .valueChanged)
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 0, height: 44))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonF))
        toolBar.setItems([space,doneButton], animated: false)
        
        text.inputAccessoryView = toolBar
        text.inputView = datePicker
        return text
    }()
    
    private let countryTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "  Pais"
        textfield.borderStyle = .none
        textfield.layer.cornerRadius = 15.0
        textfield.backgroundColor = .white
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        lastNameFTextField.delegate = self
        lastNameMTextField.delegate = self
        countryTextField.delegate = self
        
        view.addSubview(background)
        view.addSubview(tittleLabel)
        view.addSubview(nameTextField)
        view.addSubview(lastNameFTextField)
        view.addSubview(lastNameMTextField)
        view.addSubview(dateTextField)
        view.addSubview(countryTextField)
        
        registerConstaints()
        
    }
    
    func registerConstaints (){
        NSLayoutConstraint.activate([
            background.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            background.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            background.leftAnchor.constraint(equalTo: view.leftAnchor),
            background.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            tittleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tittleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            tittleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60),
            tittleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60),
            
            
            nameTextField.topAnchor.constraint(equalTo: tittleLabel.bottomAnchor, constant: 60),
            nameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60),
            nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            lastNameFTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
            lastNameFTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60),
            lastNameFTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60),
            lastNameFTextField.heightAnchor.constraint(equalToConstant: 40),
            
            lastNameMTextField.topAnchor.constraint(equalTo: lastNameFTextField.bottomAnchor, constant: 10),
            lastNameMTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60),
            lastNameMTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60),
            lastNameMTextField.heightAnchor.constraint(equalToConstant: 40),
            
            dateTextField.topAnchor.constraint(equalTo: lastNameMTextField.bottomAnchor, constant: 10),
            dateTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60),
            dateTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60),
            dateTextField.heightAnchor.constraint(equalToConstant: 40),
            
            countryTextField.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: 10),
            countryTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60),
            countryTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60),
            countryTextField.heightAnchor.constraint(equalToConstant: 40),
            
            
        ])
    }
    
    @objc func datePickerValue (_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        var stringDate = formatter.string(from: sender.date)
        dateTextField.text = stringDate
        print("fecha seleccionada:",stringDate)
    }
    
    @objc func doneButtonF (){
        dateTextField.resignFirstResponder()
    }
    
}

//MARK: - DELEGADO DE TEXTFIELD
extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("se acaba nombre")
        return true
    }
    
}
