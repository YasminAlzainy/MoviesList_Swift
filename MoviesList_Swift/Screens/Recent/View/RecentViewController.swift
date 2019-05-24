//
//  RecentViewController.swift
//  MoviesList_Swift
//
//  Created by Yasmin Ayman on 08/09/1440 AH.
//  Copyright © 1440 ITI.MAD. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

private let reuseIdentifier = "Cell"
private let basePosterPath = "https://image.tmdb.org/t/p/w185"

class RecentViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    static var check = 0
    var index : Int = 0
    var movieObjArr : [Movie] = []
    var detailsVC : MovieDetailsViewController?

    var detailsPresenter : MoviesDetailsPresenter = MoviesDetailsPresenter()
    
    var recentsPresenter : RecentsPresenter = RecentsPresenter()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.recentsPresenter.setDelegate(delegate: (self as RecentsProtocol))
        
        getMoviesList(userChoice: false)
        //self.collectionView?.reloadData()
        
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        self.collectionView?.reloadData()
        //METHOD HERE
    
    }
    

     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        detailsVC = segue.destination as? MovieDetailsViewController
        detailsVC?.setMovieDetails(movieObj: movieObjArr[index])

        //METHOD HERE don't delete or comment !
        let idStr = String(movieObjArr[index].id!)
        getVideosList(movieId: idStr , index: index)
        getReviewsList(movieId: idStr, index: index)
        
        print(movieObjArr[index].id!)


     }
    
    
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(movieObjArr.count)
        return movieObjArr.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! RecentCollectionViewCell
        
        if movieObjArr[indexPath.row].poster_path == nil{
            print("Poster is nil")
            cell.movieImageView.image = UIImage(named: "movie.jpg")
        }
        else{
            print("Poster is NOT nil")
    
        // Configure the cell
        let posterUrlString : String = basePosterPath+movieObjArr[indexPath.row].poster_path!
        print(posterUrlString)
        cell.movieImageView.sd_setImage(with: NSURL(string: posterUrlString) as URL?, placeholderImage: UIImage(named:"movie.jpg"))
        }
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        index = indexPath.row
     return true
     }
    
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (self.view.frame.size.width - 10 * 2) / 2
        let height = width * 1.5
        
        return CGSize(width: width, height: height)
    }
    
    
    @IBAction func switchBtnAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            getMoviesList(userChoice: false)
        case 1:
            getMoviesList(userChoice: true)
        default:
            getMoviesList(userChoice: false)
        }
    }
    
}


