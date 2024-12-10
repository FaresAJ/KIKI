//
//  SignInPresenter.swift
//  KIKI
//
//  Created by ons  on 27/12/2021.
//
import UIKit

protocol SignInPresenterProtocol: AnyObject {
    var view: SignInViewControllerProtocol? { get set }
    func presentLoginSuccess()
    func presentLogin(error: String)
}

class SignInPresenter: SignInPresenterProtocol {

    // MARK: - Properties

    weak var view: SignInViewControllerProtocol?

    // MARK: - Actions

    func presentLogin(error: String) {
        view?.displayLogin(error: error)
    }

    func presentLoginSuccess() {
        view?.displayLoginSuccess()
    }
}
