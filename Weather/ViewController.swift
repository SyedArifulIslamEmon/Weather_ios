import UIKit
import Alamofire
import AlamofireSwiftyJSON
import AVFoundation
import AVKit
import ObjectMapper
import SwiftGifOrigin
import CoreData
import AlamofireCoreData

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UIScrollViewDelegate{
    
    
//    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    
    let gifs = [UIImage.gif(name: "rain"), UIImage.gif(name: "sun"), UIImage.gif(name: "thunder"), UIImage.gif(name: "spring"), UIImage.gif(name: "rainy")]
    
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var cityCollectionViewOultet: UICollectionView!
    
    var player: AVPlayer?
    
    var forcast:jSONData?
    
    var videoFile: String?
    
    //var weatherCD: WeatherCD? = WeatherCD()

    override func viewDidLoad() {
        super.viewDidLoad()

        cityCollectionViewOultet.showsHorizontalScrollIndicator = false
    
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
        NotificationCenter.default.addObserver(self,selector: #selector(ViewController.loopVideo),name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,object: nil)

        cityCollectionViewOultet.delegate = self
        cityCollectionViewOultet.dataSource = self
        
        Alamofire.request("http://dataservice.accuweather.com/forecasts/v1/daily/5day/202350?apikey=Z7NpVINNJ8xBAGTtrPVSYZPnYAlAAXjJ").responseSwiftyJSON { response in
            do {
                let json : Any! = try JSONSerialization.jsonObject(with: response.data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                self.forcast = Mapper<jSONData>().map(JSONObject: json)
                self.cityCollectionViewOultet.reloadData()
                
                for index in 0..<(self.forcast?.dailyForecasts?.count ?? 0){
                    self.updating(index: index)
                }
                    self.fetching()
//                let appDelegate = UIApplication.shared.delegate as! AppDelegate
//                let context = appDelegate.persistentContainer.viewContext
//                let fetchRequest =  NSFetchRequest<NSFetchRequestResult>(entityName: "WeatherCD")
//                
//                do{
//                    let results = try context.fetch(fetchRequest)
//                    
//                    for result in results as! [NSManagedObject]
//                    {
//                        if let minimum = result.value(forKey: "headline") as? String{
//                            print(minimum)
//                        }
//                    }
//                
//                
//                }
//                catch let error as NSError{
//                    print("Unresolved error \(error), \(error.userInfo)")
//                }
//                
            }
            catch {
                return
            }
        }
        
//                let appDelegate = UIApplication.shared.delegate as! AppDelegate
//                let context = appDelegate.persistentContainer.viewContext
//                let entity =  NSEntityDescription.entity(forEntityName: "WeatherCD", in:context)
//                let tempData = NSManagedObject(entity: entity!,insertInto: context)
//                print("up")
//                print("\(self.forcast?.dailyForecasts?[1].temperature!.maximumTemperature!.value!)")
//                print("down")
//                
//                //                        tempData.setValue(self.Response!.mydailyForecasts![4].mytemperature!.myminimumTemperature!.myvalue ?? 0.0, forKey: "minimum")
//                //                        tempData.setValue(self.Response!.mydailyForecasts![4].mytemperature!.mymaximumTemperature!.myvalue ?? 0.0 , forKey: "maximum")
//                do{
//                    try context.save()
//                    print("saved")
//                }
//                catch
//                {
//                    //process error
//                    print("error")
//                }

                
                
           
        
//        Alamofire.request("http://dataservice.accuweather.com/forecasts/v1/daily/5day/202350?apikey=Z7NpVINNJ8xBAGTtrPVSYZPnYAlAAXjJ")
//            .responseInsert(context: appdelegate.persistentContainer.viewContext, type: WeatherCD.self) { response in
//                switch response.result {
//                case let .success(weatherCD):
//                    print(weatherCD)
//                    break
//
//                case .failure: break
//                    // handle error
//                }
//        }
        
//        Alamofire.request("http://dataservice.accuweather.com/forecasts/v1/daily/5day/202350?apikey=Z7NpVINNJ8xBAGTtrPVSYZPnYAlAAXjJ").responseInsert(context: appdelegate.persistentContainer.viewContext, type: DailyForecastsCD.self) { response in
//                switch response.result {
//                case let .success(dailyForecastsCD):
//                    print(dailyForecastsCD)
//                    break
//        
//                case .failure: break
//                    // handle error
//                }
//        }
        
    }
    
    
    func getDayOfWeek(today:String)->Int {
        
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"
        let todayDate = formatter.date(from: today)
        let myCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        let myComponents = myCalendar.components(.weekday, from: todayDate!)
        let weekDay = myComponents.weekday
        return weekDay ?? 0
    }
    
    func loopVideo() {
        player?.seek(to: kCMTimeZero)
        player?.play()
    }
   
    func convertDateFormatter(date: String) -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
        let date = dateFormatter.date(from: date)
        
        dateFormatter.dateFormat = "dd/MMM/yyyy"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
        let timeStamp = dateFormatter.string(from: date!)
        return timeStamp
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  self.forcast?.dailyForecasts?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellCollection = cityCollectionViewOultet.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CityCollectionViewCell
        cellCollection.lblHighTemperature.text = "\(self.forcast?.dailyForecasts?[indexPath.item].temperature?.maximumTemperature?.value ?? 0)ºF"
        cellCollection.lblLowTemperature.text = "\(self.forcast?.dailyForecasts?[indexPath.item].temperature?.minimumTemperature?.value ?? 0)ºF"
        cellCollection.lblWeatherCondition.text = "\(self.forcast?.dailyForecasts?[indexPath.item].day?.iconPhrase ?? "")"
        cellCollection.lblWeatherDegree.text = "\(((self.forcast?.dailyForecasts?[indexPath.item].temperature?.minimumTemperature?.value ?? 0) + (self.forcast?.dailyForecasts?[indexPath.item].temperature?.maximumTemperature?.value ?? 0)) / 2)ºF"
        
        cellCollection.lblDayIcon.text = "\(self.forcast?.dailyForecasts?[indexPath.item].day?.icon ?? 0)"
        cellCollection.lblDayIconPhrase.text = "\(self.forcast?.dailyForecasts?[indexPath.item].day?.iconPhrase ?? "")"
        cellCollection.lblNightIcon.text = "\(self.forcast?.dailyForecasts?[indexPath.item].night?.icon ?? 0)"
        cellCollection.lblNightIconPhrase.text = "\(self.forcast?.dailyForecasts?[indexPath.item].night?.iconPhrase ?? "")"
        cellCollection.lblUnitType.text = "\(self.forcast?.dailyForecasts?[indexPath.item].temperature?.minimumTemperature?.unitType ?? 0)"
        
        cellCollection.lblSources.text = self.forcast?.dailyForecasts?[indexPath.item].sources?[0] ?? ""
        cellCollection.lblMobileLink.text = self.forcast?.dailyForecasts?[indexPath.item].mobileLink ?? ""
        cellCollection.lblLink.text = self.forcast?.dailyForecasts?[indexPath.item].link ?? ""
        
        cellCollection.lblForecast.text = "Today: Clear currently. It's \(((self.forcast?.dailyForecasts?[indexPath.item].temperature?.minimumTemperature?.value ?? 0) + (self.forcast?.dailyForecasts?[indexPath.item].temperature?.maximumTemperature?.value ?? 0)) / 2)ºF; the high today was forecast as \(self.forcast?.dailyForecasts?[indexPath.item].temperature?.maximumTemperature?.value ?? 0)ºF."
        
        let wday = self.forcast!.dailyForecasts![indexPath.item].date ?? ""
        let weekday = getDayOfWeek(today: wday)
        if weekday == 1{
            cellCollection.lblDay.text = "Sunday"
        }
        else if weekday == 2{
            cellCollection.lblDay.text = "Monday"
        }
        else if weekday == 3{
            cellCollection.lblDay.text = "Tuesday"
        }
        else if weekday == 4{
            cellCollection.lblDay.text = "Wednesday"
        }
        else if weekday == 5{
            cellCollection.lblDay.text = "Thursday"
        }
        else if weekday == 6{
            cellCollection.lblDay.text = "Friday"
        }
        else if weekday == 7{
            cellCollection.lblDay.text = "Saturday"
        }
        
        let wdate = self.forcast!.dailyForecasts![indexPath.item].date ?? ""
        let weekdate = convertDateFormatter(date: wdate)
        
        cellCollection.lblDate.text = weekdate
        
        cellCollection.gifImageView.image = nil
        cellCollection.gifImageView.image = gifs[indexPath.item % gifs.count]

        return cellCollection
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width , height: self.view.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let indexPath = cityCollectionViewOultet.indexPathsForVisibleItems.first {
            pageControl.currentPage = indexPath.row
        }
    }
    
    func fetching(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TemperatureCD")
        do {
            let results =
                try context.fetch(fetchRequest)
            print( results.count)
            for result in results as! [NSManagedObject]
            {
                if let minimum = result.value(forKey: "min") as? Float
                {
                    print("minimum \(minimum)")
                }
//                if let maximum = result.value(forKey: "maximum") as? Float
//                {
//                    print("maximum \(maximum)")
//                }
//                if let dayPhrase = result.value(forKey: "day") as? String
//                {
//                    print("day phrase \(dayPhrase)")
//                }
//                if let nightPhrase = result.value(forKey: "night") as? String
//                {
//                    print("day phrase \(nightPhrase)")
//                }
//                if let severity = result.value(forKey: "severity") as? Int
//                {
//                    print("severity \(severity)")
//                }
//                if let day = result.value(forKey: "date") as? String
//                {
//                    print("date \(day) \n")
//                }
            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    func updating(index : Int)
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entity =  NSEntityDescription.entity(forEntityName: "TemperatureCD",in:context)
        
        let tempData = NSManagedObject(entity: entity!, insertInto: context)
        
        tempData.setValue(self.forcast?.dailyForecasts?[index].temperature?.minimumTemperature?.value ?? 0, forKey: "min")
//        tempData.setValue(self.forcast?.dailyForecasts?[index].temperature?.maximumTemperature?.value ?? 0 , forKey: "maximum")
        
        
//        tempData.setValue(self.forcast?.dailyForecasts?[index].day?.iconPhrase ?? "" , forKey: "day")
//        
//        tempData.setValue(self.forcast?.dailyForecasts?[index].night?.iconPhrase ?? "" , forKey: "night")
//        
//        let day1 = getDayOfWeek(today : (self.forcast?.dailyForecasts?[index].date ?? "") )
//        tempData.setValue(day1, forKey: "date")
        
        //tempData.setValue(self.forcast!.headline!.severity ?? 0, forKey: "severity")
        
        do{
            try context.save()
            print("\n saved")
            print("\(self.forcast?.dailyForecasts?[index].temperature?.minimumTemperature?.value ?? 0)")
//            print("\(self.forcast?.dailyForecasts?[index].temperature?.minimumTemperature?.value ?? 0)")
//            print("\(self.forcast?.dailyForecasts?[index].night?.iconPhrase ?? "")")
//            print("\(self.forcast?.dailyForecasts?[index].day?.iconPhrase ?? "")")
//            //print("\(self.forcast?.headline!.severity!)")
//            print("\(getDayOfWeek(today : (self.forcast?.dailyForecasts?[index].date ?? "")))")
        }
        catch
        {
            print("error")
        }
    }
}
