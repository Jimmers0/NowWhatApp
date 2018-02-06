//
//  ViewController.swift
//  AlertApp
//
//  Created by Jamie Randall on 2/5/18.
//  Copyright © 2018 Jamie Randall. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    @IBOutlet weak var darthVader: UIImageView!
    @IBOutlet weak var darthMaul: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        let maulGesture = UITapGestureRecognizer(target: self, action: #selector(maulhandleTap(sender:)))

        darthVader.isUserInteractionEnabled = true
        darthMaul.isUserInteractionEnabled = true
        
        darthVader.addGestureRecognizer(tapGesture)
        darthMaul.addGestureRecognizer(maulGesture)
    }
    
    @IBAction func infoButtonTapped(_ sender: Any) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "InformationViewController")
        viewController.modalPresentationStyle = .popover
        let popover: UIPopoverPresentationController = viewController.popoverPresentationController!
        popover.barButtonItem = sender as? UIBarButtonItem
        popover.delegate = self
        present(viewController, animated: true, completion:nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        let alertController = UIAlertController(title: "Darth Vader", message: "Once a heroic Jedi Knight, Darth Vader was seduced by the dark side of the Force, became a Sith Lord, and led the Empire’s eradication of the Jedi Order. He remained in service of the Emperor -- the evil Darth Sidious -- for decades, enforcing his Master’s will and seeking to crush the fledgling Rebel Alliance. But there was still good in him…", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "ok", style: .default) { (alert) in
            print("User tapped ok")
        }
        
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
        
    }
    
    @objc func maulhandleTap(sender: UITapGestureRecognizer) {
        let alertController = UIAlertController(title: "Darth Maul", message: "Maul was a Dathomirian Zabrak male who lived during the waning days of the Galactic Republic and the reign of the Galactic Empire. The son of Mother Talzin of the Nightsisters, he was taken as the Sith apprentice of Darth Sidious, the Dark Lord of the Sith, and given the name Darth Maul. After revealing the existence of the Sith to the Jedi Order, Maul supposedly fell in a lightsaber duel against Obi-Wan Kenobi during the Battle of Naboo. Over a decade later, he returned from exile and formed the criminal army known as the Shadow Collective, intent on reclaiming the power he had lost. His quest for revenge against Kenobi and the Sith continued into the Imperial age, bringing him into conflict with the early rebellion against the Empire.", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "ok", style: .default) { (alert) in
            print("User tapped ok")
        }
        
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
        
    }

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .fullScreen
    }
    
    func presentationController(_ controller: UIPresentationController, viewControllerForAdaptivePresentationStyle style: UIModalPresentationStyle) -> UIViewController? {
        let navigationController = UINavigationController(rootViewController: controller.presentedViewController)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(ViewController.dismissViewController))
        navigationController.topViewController?.navigationItem.rightBarButtonItem = doneButton
        return navigationController
    }
    
    @objc func dismissViewController() {
        self.dismiss(animated: true, completion: nil)
    }
    
}





