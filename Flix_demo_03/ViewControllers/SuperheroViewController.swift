//
//  SuperheroViewController.swift
//  Flix_demo_03
//
//  Created by Jetry Dumont on 9/24/18.
//  Copyright © 2018 Wendy Jean. All rights reserved.
//

import UIKit

class SuperheroViewController: UIViewController, UICollectionViewDataSource {
    
    
    @IBOutlet weak var CollectionView: UICollectionView!
    var movies: [[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CollectionView.dataSource = self
        
        
        let layout = CollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = layout.minimumInteritemSpacing
        let cellsPerline: CGFloat = 2
        let interIntemSpacingTotal = layout.minimumInteritemSpacing * (cellsPerline - 1)
        let width = CollectionView.frame.size.width / cellsPerline - interIntemSpacingTotal / cellsPerline
        layout.itemSize = CGSize(width: width, height: width  * 3 / 2)
        
        fecthMovies()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "posterCell", for: indexPath) as! posterCell
        let movie = movies [indexPath.item]
        if let posterPathString = movie["poster_path"] as? String {
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            let posterURL = URL(string: baseURLString + posterPathString)!
            cell.posterImageView.af_setImage(withURL: posterURL)
        }
        return cell
    }
    
    func  fecthMovies() {
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // this will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else
                if let data = data {
                let dataDictionary = try! JSONSerialization .jsonObject(with: data,options: []) as! [String: Any]
                let movies = dataDictionary["results"] as! [[String: Any]]
                print("*********************",movies)
                self.movies = movies
                self.CollectionView.reloadData()
            }
            
        }
        task.resume()
    }
    
        

        // Do any additional setup after loading the view.

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
