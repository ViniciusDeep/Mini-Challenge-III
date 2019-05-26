//
//  HomeController.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 22/04/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//
import UIKit

class CustomTabBarController: UITabBarController{
    override func viewDidLoad(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(handleSignOut))
        setComponentsInTab()
        checkLogin()
    }
    fileprivate func setComponentsInTab() {
       viewControllers = [
                          createNav(viewController: ListGoalsViewController(), title: "Goals", imageNamed: "goalstab"),
                          createNav(viewController: OptionsController(), title: "Options", imageNamed: "options")
                         ]
    }
    fileprivate func createNav(viewController: UIViewController, title: String, imageNamed: String) -> UINavigationController {
        let navVc = UINavigationController(rootViewController: viewController)
        viewController.view.backgroundColor =  #colorLiteral(red: 0.9333333333, green: 0.9450980392, blue: 0.9607843137, alpha: 1)
        navVc.navigationBar.barTintColor = #colorLiteral(red: 0.2823529412, green: 0.4745098039, blue: 0.8431372549, alpha: 1)
        navVc.navigationBar.prefersLargeTitles = true
        setNavigationTextColor(navVc)
        viewController.navigationItem.title = title
        navVc.tabBarItem.title = title
        navVc.tabBarItem.image = UIImage(named: imageNamed)
        return navVc
    }
    
    fileprivate func setNavigationTextColor(_ navigation: UINavigationController){
        navigation.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), NSAttributedString.Key.font: UIFont(name: "AlNile-Bold", size: 40)!]
        navigation.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), NSAttributedString.Key.font: UIFont(name: "AlNile-Bold", size: 16)!]
    }
    
    @objc func handleSignOut() {
        UserDefaults.standard.setIsLoggedIn(value: false)
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
    fileprivate func isLoggedIn() -> Bool {
        return UserDefaults.standard.isLoggedIn()
    }
    @objc func showLoginController() {
        let loginController = LoginController()
        present(loginController, animated: true, completion: {
        })
    }
    
    fileprivate func checkLogin() {
        if isLoggedIn() {
        } else {
            perform(#selector(showLoginController), with: nil, afterDelay: 0.01)
        }
    }
}
