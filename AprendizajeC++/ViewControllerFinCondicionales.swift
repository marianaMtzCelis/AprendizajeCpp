//
//  ViewControllerFinCondicionales.swift
//  AprendizajeC++
//
//  Created by Mariana Martínez Celis González on 21/04/21.
//

import UIKit

class ViewControllerFinCondicionales: UIViewController {
    
    var pts = 0
    @IBOutlet weak var lbFinDeJuego: UILabel!
    @IBOutlet weak var labelpts: UILabel!
    @IBOutlet weak var btJugar: UIButton!
    @IBOutlet weak var btMenu: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        labelpts.text = String(pts)
    }
    
    
    @IBAction func volverAlMenu(_ sender: Any) {
        if let first = presentingViewController,
            let second = first.presentingViewController{
                first.view.isHidden = true
                second.dismiss(animated: true)
            }
    }
    
    @IBAction func volverAJugar(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
}
