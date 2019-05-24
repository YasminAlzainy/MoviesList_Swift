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
    var currentMovie : Movie?
    var reviewsTable = Array<Review>()
    var videosTable = Array<Video>()
    var myReviewsTableView : UITableView?
    var myVideosTableView : UITableView?
    static var reviewsCount = 0
    static var videosCount = 0
    
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
        
        //Setting Movie Object into Labels and TextViews
        titleLabel.text = currentMovie?.original_title
        voteAvgLabel.text = String(format:"%.f", ((currentMovie?.vote_average)!/10))
        releasedateLabel.text = currentMovie?.release_date
        overviewTextView.text = currentMovie?.overview
        
    }
    
    func readVideosArray()  {
        print(videosTable.count)
        myVideosTableView?.reloadData()
    }
    
    func readReviewsArray() {
        print(reviewsTable.count)
        myReviewsTableView?.reloadData()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rows : Int?
        switch tableView {
        case reviewsTableView:
            myReviewsTableView = tableView
            rows = reviewsTable.count
        case trailersTableView:
            myVideosTableView = tableView
            rows = videosTable.count
        default:
            rows = 0
        }
        return rows!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        switch tableView {
            case reviewsTableView:
                let cell:ReviewsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ReviewsTableViewCell
            cell.authorLabel.text = reviewsTable[indexPath.row].author
                print(reviewsTable[indexPath.row].author!)
            
                cell.contentTextView.text = reviewsTable[indexPath.row].content
                print(reviewsTable[indexPath.row].content!)
                
            return cell
//                cell.authorLabel.text = reviewsTable[MovieDetailsViewController.reviewsCount].author
//                cell.contentLabel.text = reviewsTable[MovieDetailsViewController.reviewsCount].content
//            MovieDetailsViewController.reviewsCount = MovieDetailsViewController.reviewsCount + 1
//        case trailersTableView:
//            let cell:TrailersTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        
        default: break
            
            }
        
        return cell
 
    }
    
    
    @IBAction func markAsFavAction(_ sender: UIButton) {
        
        addToFavoriteMovies(newMovie: currentMovie!)
        
        //or
        //deleteFromFavoriteMovies(newMovie: newMovie)
    }
    

}

