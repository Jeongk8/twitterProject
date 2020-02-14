//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Jeong Kim on 2/3/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var profileimageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var favButton: UIButton!
    
    @IBAction func reTweet(_ sender: Any) {
        
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(true)
            
            
        }, failure:{
            (error) in print("error is retweeting: \(error)")
            
        } )
        
        
        
    }
    
    var favorited:Bool = false
    var tweetId:Int = -1
    
     
    
    
    @IBAction func favoriteTweet(_ sender: Any) {
        
        let tobeFavorited = !favorited
        
        if(tobeFavorited){
            
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                
                self.setFavorite(true)
                
            }, failure: {(Error) in print("Favorite did not succeed: \(Error)")
                
            })
        }
        
        else {
            
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                
                self.setFavorite(false)
                
            }, failure: {(Error) in print("unfavorite did not succedd: \(Error)")
            
            })
    
            
        }
        
        
    }
    

    
    
    
    func setFavorite(_ isFavorited:Bool){
        
        favorited = isFavorited
        
        if(favorited) {
            
            favButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
            
            
        }
        
        else {
            
             favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
            
        }
        
        
    }
    
    @IBOutlet weak var retweetButton: UIButton!
    
    
    func setRetweeted(_ isRetweeted:Bool){
        
        if(isRetweeted){
            
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for:
                UIControl.State.normal)
            retweetButton.isEnabled = false
            
            
        } else{
            
            retweetButton.setImage(UIImage(named: "retweet-icon"), for:
                UIControl.State.normal)
            retweetButton.isEnabled = true
            
            
            
        }
        
        
    }
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
