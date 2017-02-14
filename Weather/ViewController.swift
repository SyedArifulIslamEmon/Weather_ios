import UIKit
import Alamofire
import AlamofireSwiftyJSON
import AVFoundation
import AVKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    var headline : [Headline] = []
    var weather : [DailyForecasts] = []

    @IBOutlet var cityCollectionViewOultet: UICollectionView!
    
    var player: AVPlayer?
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //playVideo()
        let videoURL: NSURL = Bundle.main.url(forResource: "storm_raindrops_on_window", withExtension: "mp4")! as NSURL
        
        player = AVPlayer(url: videoURL as URL)
        player?.actionAtItemEnd = .none
        player?.isMuted = true
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        playerLayer.zPosition = -1
        
        playerLayer.frame = view.frame
        
        view.layer.addSublayer(playerLayer)
        
        player?.play()
        
        //loop video
        NotificationCenter.default.addObserver(self,
                                                         selector: #selector(ViewController.loopVideo),
                                                         name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                                         object: nil)

        
        
        cityCollectionViewOultet.delegate = self
        cityCollectionViewOultet.dataSource = self
        
        Alamofire.request("http://dataservice.accuweather.com/forecasts/v1/daily/5day/202350?apikey=Z7NpVINNJ8xBAGTtrPVSYZPnYAlAAXjJ").responseSwiftyJSON { response in
            print("###Success: \(response.result.isSuccess)")
            guard let value = response.result.value else{fatalError()}
                print(value.count)
            print("###Headline Value: \(value["Headline"].dictionary!)")
            print("###DailyForecasts Value: \(value["DailyForecasts"].array!)")
            print("###DailyForecasts Value: \(value["DailyForecasts"].array![0]["Date"].string!)")
        }
    }
    
    
    func loopVideo() {
        player?.seek(to: kCMTimeZero)
        player?.play()
    }
    

    
    
    func convertToDictionary(text: String) -> [String: AnyObject]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellCollection = cityCollectionViewOultet.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CityCollectionViewCell
        
        return cellCollection
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width , height: self.view.frame.height)
    }
    /*
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
            return CGSize(width)
    
    }*/
}
