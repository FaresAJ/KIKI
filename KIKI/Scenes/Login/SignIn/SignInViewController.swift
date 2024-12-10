//
//  SignInViewController.swift
//  KIVI
//
//  Created by Fares Ajimi on 3/12/2021.
//

import UIKit
import SwiftKeychainWrapper

protocol SignInViewControllerProtocol: UIViewControllerRoutingProtocol {
    func displayLoginSuccess()
    func displayLogin(error: String)
}

class SignInViewController: BaseViewController, SignInViewControllerProtocol {

    // MARK: - Outlets

    @IBOutlet weak var connexionUILabel: UILabel!
    @IBOutlet weak var backButton: CustomArrowBackButton!
    @IBOutlet weak var nextButton: CustomNextButtonWithPinkBorder!
    @IBOutlet weak var saveLoginButton: CustomCheckBox!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!

    // MARK: - Properties

    var interactor: SignInInteractorProtocol?

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }

    // MARK: - UI

    func setUpUI () {
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }

    // MARK: - Actions

    @objc
    func textFieldDidChange(_ sender: UITextField) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        if email.isEmptyOrWhitespace() || password == "" {
            nextButton.set(enabled: false)
        } else {
            nextButton.set(enabled: true)
        }
    }

    @IBAction func loginUser(_ sender: Any) {
        nextButton.isLoading(true)
        if let email = emailTextField.text {
            if let password = passwordTextField.text {
                interactor?.loginUser(email: email, password: password)
            }
        }
    }

    @IBAction func saveLogin(_ sender: Any) {
    }

    func displayLogin(error: String) {
        nextButton.isLoading(false)
        let alert = UIAlertController(title: "Error", message: error.capitalizingFirstLetter(), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style {
            case .cancel: print("cancel")
            case .destructive: print("destructive")
            case .default:
                print("default")
            @unknown default:
                print("default")
            }
        }))
        present(alert, animated: true, completion: nil)
    }

    func displayLoginSuccess() {
        nextButton.isLoading(false)
    }
}
