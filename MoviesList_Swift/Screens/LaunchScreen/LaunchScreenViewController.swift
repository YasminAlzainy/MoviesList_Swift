//
//  LaunchScreenViewController.swift
//  MoviesList_Swift
//
//  Created by Mai Alaa on 5/21/19.
//  Copyright © 2019 ITI.MAD. All rights reserved.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    @IBOutlet weak var appIconImage: UIImageView!
    
    @IBOutlet weak var appLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appLabel.font = UIFont.boldSystemFont(ofSize: 50)
        
        //Animating App Title Label
        view.addSubview(appLabel)
        UIView.animateKeyframes(withDuration: 1.5, delay: 0.1, options: UIViewKeyframeAnimationOptions.beginFromCurrentState, animations: {
            //self.appLabel.center = CGPoint(x: 20, y: 0)
            self.appLabel.center.x = self.view.frame.width
            self.appLabel.center.y = self.view.frame.height/2
        }, completion: nil)
        
        //Animation App Icon Image
        view.addSubview(appIconImage)
        UIView.animate(withDuration: 5.0, delay: 1.5, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            //self.appIconImage.center = CGPoint(x: 250, y: 172+200)
            self.appIconImage.center.x = self.view.frame.width
            self.appIconImage.center.y = self.view.frame.height
        }, completion: nil)
        
        //Go to home view controller after specfic amount of time
        let deadlineTime = DispatchTime.now() + .seconds(5)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            print("test")
            self.performSegue(withIdentifier: "NextVC", sender: nil)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
