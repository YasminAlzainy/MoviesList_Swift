//
//  ViewController.swift
//  MoviesList_Swift
//
//  Created by Yasmin Ayman on 08/09/1440 AH.
//  Copyright © 1440 ITI.MAD. All rights reserved.
//

import UIKit

class MovieDetailsViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {

    var detailsPresenter : MoviesDetailsPresenter = MoviesDetailsPresenter()
    var myMovieObject : Movie?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var voteAvgLabel: UILabel!
    @IBOutlet weak var releasedateLabel: UILabel!
    @IBOutlet weak var overviewTextView: UITextView!
    @IBOutlet weak var trailersTableView: UITableView!
    @IBOutlet weak var reviewsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.trailersTableView.delegate = self
        self.trailersTableView.dataSource = self
        self.reviewsTableView.delegate = self
        self.reviewsTableView.dataSource = self
        self.detailsPresenter.setDelegate(delegate: self)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        switch tableView {
//        case reviewsTableView:
//            //
//        case trailersTableView:
//
//        default:
//            //
//        }
        return 10;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //        switch tableView {
        //        case reviewsTableView:
        //            //
        //        case trailersTableView:
        //
        //        default:
        //            //
        //        }
        
        return cell
 
    }
    
    
    @IBAction func markAsFavAction(_ sender: UIButton) {
    }
    
    


}

