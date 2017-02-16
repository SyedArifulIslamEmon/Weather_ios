//
//  CityCollectionViewCell.swift
//  Weather
//
//  Created by Sierra 4 on 13/02/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class CityCollectionViewCell: UICollectionViewCell,UITableViewDelegate,UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var gifImageView: UIImageView!
    
    @IBOutlet var lblCityName: UILabel!
    @IBOutlet var lblWeatherCondition: UILabel!
    @IBOutlet var lblWeatherDegree: UILabel!
    @IBOutlet var lblDay: UILabel!
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var lblHighTemperature: UILabel!
    @IBOutlet var lblLowTemperature: UILabel!
    @IBOutlet var lblForecast: UILabel!
    @IBOutlet var lblSunriseTime: UILabel!
    @IBOutlet var lblSunsetTime: UILabel!
    @IBOutlet var lblDayIcon: UILabel!
    @IBOutlet var lblDayIconPhrase:UILabel!
    @IBOutlet var lblNightIcon: UILabel!
    @IBOutlet var lblNightIconPhrase: UILabel!
    @IBOutlet var lblUnitType: UILabel!
    @IBOutlet var lblSources: UILabel!
    @IBOutlet var lblMobileLink: UILabel!
    @IBOutlet var lblLink: UILabel!
   
    @IBOutlet var tableViewCellOutlet: UITableView!
    
    @IBOutlet var hourlyCollectionViewCellOutlet: UICollectionView!
    
    var forcast:jSONData?
   
    var counter = Int()
    
    var hourArray : [String] = ["00:00", "01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00"]
    
    var hourTemperatureArray : [String] = ["8°F", "7°F", "7°F", "6°F", "6°F", "9°F", "10°F", "12°F", "14°F", "15°F", "16°F", "16°F", "16°F", "16°F", "19°F", "20°F", "21°F", "20°F", "19°F", "19°F", "18°F", "15°F", "12°F", "10°F"]
    
    var imgHourArray = [#imageLiteral(resourceName: "unnamed"),#imageLiteral(resourceName: "unnamed"),#imageLiteral(resourceName: "unnamed"),#imageLiteral(resourceName: "unnamed"),#imageLiteral(resourceName: "unnamed"),#imageLiteral(resourceName: "unnamed"),#imageLiteral(resourceName: "Weather-icon"), #imageLiteral(resourceName: "Weather-icon"),#imageLiteral(resourceName: "Weather-icon"),#imageLiteral(resourceName: "Weather-icon"),#imageLiteral(resourceName: "Weather-icon"),#imageLiteral(resourceName: "Weather-icon"),#imageLiteral(resourceName: "Weather-icon"),#imageLiteral(resourceName: "Weather-icon"),#imageLiteral(resourceName: "Weather-icon"),#imageLiteral(resourceName: "Weather-icon"),#imageLiteral(resourceName: "Weather-icon"),#imageLiteral(resourceName: "Weather-icon"),#imageLiteral(resourceName: "Weather-icon"),#imageLiteral(resourceName: "Cloudy Night"),#imageLiteral(resourceName: "unnamed"),#imageLiteral(resourceName: "unnamed"),#imageLiteral(resourceName: "unnamed"),#imageLiteral(resourceName: "unnamed")]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        hourlyCollectionViewCellOutlet.showsHorizontalScrollIndicator = false
        tableViewCellOutlet.showsVerticalScrollIndicator = false
        tableViewCellOutlet.allowsSelection = false;
        
        self.tableViewCellOutlet.separatorStyle = .none
        
        Alamofire.request("http://dataservice.accuweather.com/forecasts/v1/daily/5day/202350?apikey=Z7NpVINNJ8xBAGTtrPVSYZPnYAlAAXjJ").responseSwiftyJSON { response in
            
            do {
                let json : Any! = try JSONSerialization.jsonObject(with: response.data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                self.forcast = Mapper<jSONData>().map(JSONObject: json)

                self.tableViewCellOutlet.reloadData()
            }
            catch {
                return
            }
            self.tableViewCellOutlet.reloadData()
        }
        
        tableViewCellOutlet.delegate = self
        tableViewCellOutlet.dataSource = self
        hourlyCollectionViewCellOutlet.delegate = self
        hourlyCollectionViewCellOutlet.dataSource = self
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.forcast?.dailyForecasts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableViewCellOutlet.dequeueReusableCell(withIdentifier: "tableCell") as! WeatherTableViewCell
        
        cell.lblHighTemperatureWeekDays.text = "\(self.forcast?.dailyForecasts?[indexPath.item].temperature?.maximumTemperature?.value ?? 0)ºF"
        cell.lblLowTemperatureWeekDays.text = "\(self.forcast?.dailyForecasts?[indexPath.item].temperature?.minimumTemperature?.value ?? 0)ºF"
        
        
        let wday = self.forcast!.dailyForecasts![indexPath.item].date ?? ""
        
        let weekday = getDayOfWeek(today: wday)
        
        if weekday == 1{
            cell.lblWeekDays.text = "Sunday"
        }
        else if weekday == 2{
            cell.lblWeekDays.text = "Monday"
        }
        else if weekday == 3{
            cell.lblWeekDays.text = "Tuesday"
        }
        else if weekday == 4{
            cell.lblWeekDays.text = "Wednesday"
        }
        else if weekday == 5{
            cell.lblWeekDays.text = "Thursday"
        }
        else if weekday == 6{
            cell.lblWeekDays.text = "Friday"
        }
        else if weekday == 7{
            cell.lblWeekDays.text = "Saturday"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellCollection = hourlyCollectionViewCellOutlet.dequeueReusableCell(withReuseIdentifier: "hourlyWeatherCollectionCell", for: indexPath) as! HourlyWeatherCollectionViewCell
        
        cellCollection.lblHourTimeOfDay.text = hourArray[indexPath.row]
        cellCollection.lblHourTemperatureOfDay.text = hourTemperatureArray[indexPath.row]
        cellCollection.imgHourWeather.image = imgHourArray[indexPath.row]

        
        return cellCollection
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80 , height: hourlyCollectionViewCellOutlet.bounds.height)
    }
}
