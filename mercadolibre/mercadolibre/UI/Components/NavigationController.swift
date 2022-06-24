//
//  NavigationController.swift
//  mercadolibre
//
//  Created by Cesar Guasca on 23/06/22.
//

import Foundation
import UIKit

public final class NavigationController: UINavigationController {
    public override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
   public override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       navigationController?.navigationBar.prefersLargeTitles = true

       let appearance = UINavigationBarAppearance()
       appearance.backgroundColor =  UIColor.init(named: "meliColor")
       appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
       appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]

       self.navigationBar.tintColor = .black
       self.navigationBar.standardAppearance = appearance
       self.navigationBar.compactAppearance = appearance
       self.navigationBar.scrollEdgeAppearance = appearance
    }
}
