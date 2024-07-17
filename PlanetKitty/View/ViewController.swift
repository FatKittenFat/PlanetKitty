//
//  ViewController.swift
//  PlanetKitty
//
//  Created by Fatima Ramirez on 15/07/24.
//

import UIKit

class ViewController: UIViewController  {
    
    private let background: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "background.png")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let planetImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "globe.americas.fill")
        image.contentMode = .scaleAspectFit
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let tittleLabel: UILabel = {
        let label = UILabel()
        label.text = "Planet Kitty"
        label.font = UIFont(name: "Futura", size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtittleLabel: UILabel = {
        let label = UILabel()
        label.text = "¿en que planeta estoy?"
        label.font = UIFont(name: "Futura", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let userTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "  usuario"
        textfield.borderStyle = .none
        textfield.layer.cornerRadius = 15.0
        textfield.backgroundColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
        let leftViewMode = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        textfield.leftView = leftViewMode
        textfield.leftViewMode = .always
        let icon = UIImageView(frame: CGRect(x: 5, y: 0, width: 20, height: 20))
        icon.image = UIImage(systemName: "person.circle")
        icon.tintColor = .gray
        leftViewMode.addSubview(icon)

        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    private let passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "  contraseña"
        textfield.borderStyle = .none
        textfield.layer.cornerRadius = 15.0
        textfield.backgroundColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
        let leftViewMode = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        textfield.leftView = leftViewMode
        textfield.leftViewMode = .always
        let icon = UIImageView(frame: CGRect(x: 5, y: 0, width: 20, height: 20))
        icon.image = UIImage(systemName: "lock.fill")
        icon.tintColor = .gray
        leftViewMode.addSubview(icon)

        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    private let buttonLogin: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("Entrar", for: .normal)
        button.layer.cornerRadius = 15.0
        button.addTarget(self, action: #selector(toLogin), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let registerLabel: UILabel = {
        let label = UILabel()
        label.text = "No tienes cuenta?"
        label.font = UIFont(name: "Futura", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let buttonRegister: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.setTitle("Registrarse", for: .normal)
        button.layer.cornerRadius = 15.0
        button.addTarget(self, action: #selector(toRegister), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(background)
        view.addSubview(tittleLabel)
        view.addSubview(subtittleLabel)
        view.addSubview(planetImage)
        view.addSubview(userTextField)
        view.addSubview(passwordTextField)
        view.addSubview(buttonLogin)
        view.addSubview(registerLabel)
        view.addSubview(buttonRegister)
        
        homeConstraints()
        
        print("cargado")
    }
    
    func homeConstraints (){
        NSLayoutConstraint.activate([
            background.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            background.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            background.leftAnchor.constraint(equalTo: view.leftAnchor),
            background.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            planetImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            planetImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            planetImage.widthAnchor.constraint(equalToConstant: 150),
            planetImage.heightAnchor.constraint(equalToConstant: 150),
            
            tittleLabel.topAnchor.constraint(equalTo: planetImage.bottomAnchor, constant: 50),
            tittleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            subtittleLabel.topAnchor.constraint(equalTo: tittleLabel.bottomAnchor, constant: 5),
            subtittleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            userTextField.topAnchor.constraint(equalTo: subtittleLabel.bottomAnchor, constant: 100),
            userTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60),
            userTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60),
            userTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant: 20),
            passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60),
            passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            buttonLogin.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            buttonLogin.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60),
            buttonLogin.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60),
            
            registerLabel.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: 10),
            registerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonRegister.topAnchor.constraint(equalTo: registerLabel.bottomAnchor, constant: 10),
            buttonRegister.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60),
            buttonRegister.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60),
        ])
        
    }
    
    @objc func toLogin(){
        print("button login pressed")
    }
    
    @objc func toRegister(){
        print("button register pressed")
        present(RegisterViewController(), animated: true)
    }


}

