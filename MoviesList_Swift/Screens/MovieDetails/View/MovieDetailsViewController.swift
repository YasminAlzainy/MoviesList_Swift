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
    private let basePosterPath = "https://image.tmdb.org/t/p/w185"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var voteAvgLabel: UILabel!
    @IBOutlet weak var releasedateLabel: UILabel!
    @IBOutlet weak var overviewTextView: UITextView!
    @IBOutlet weak var movieImageView: UIImageView!
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
        voteAvgLabel.text = String(format:"%.f", ((currentMovie?.vote_average)!))
        releasedateLabel.text = currentMovie?.release_date
        overviewTextView.text = currentMovie?.overview
        if currentMovie?.poster_path == nil{
            print("Poster is nil")
            movieImageView.image = UIImage(named: "movie.jpg")
        }
        else{
            print("Poster is NOT nil")
            
            let posterUrlString : String = basePosterPath+currentMovie!.poster_path!
            print(posterUrlString)
            movieImageView.sd_setImage(with: NSURL(string: posterUrlString) as URL?, placeholderImage: UIImage(named:"movie.jpg"))
        }
        
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
            
        case myVideosTableView:
             let cell:TrailersTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TrailersTableViewCell
        
            cell.trailerTitle.text = videosTable[indexPath.row].name
             print(videosTable[indexPath.row].name!)
             
            var thumbImage = getTrailerThumbnail(id: videosTable[indexPath.row].key!)
            cell.trailerThumbnail.sd_setImage(with: NSURL(string: thumbImage) as URL?, placeholderImage: UIImage(named:"youtube-play.png"))
             print(thumbImage+"************") //test
             
            return cell
        default: break
        }
        
        return cell
 
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch tableView {
        case trailersTableView:
            openYoutube(url: videosTable[indexPath.row].key!)
        default:
            print("")
        }
    }
    
    @IBAction func addToFavorites(_ sender: UIButton) {
        addToFavoriteMovies(newMovie: currentMovie!)

    }
    
    @IBAction func removeFromFav(_ sender: UIButton) {
        deleteFromFavoriteMovies(newMovie: currentMovie!)
    }
    
    
    
    func openYoutube(url : String) {
        let webUrl = NSURL(string: "https://www.youtube.com/watch?v=\(url)")
        let appUrl = NSURL(string: "youtube://www.youtube.com/watch?v=\(url)")
        let application = UIApplication.shared
        if(application.canOpenURL(appUrl! as URL)){
            application.open(appUrl! as URL, options: [:], completionHandler: nil)
        }
        else{
            application.open(webUrl! as URL, options: [:], completionHandler: nil)
        }

    }
    
    func getTrailerThumbnail(id: String) -> String{
        let thumbnailURL = "https://img.youtube.com/vi/" + id + "/1.jpg"
        return thumbnailURL
    }
    
}


