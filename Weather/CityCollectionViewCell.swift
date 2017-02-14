//
//  CityCollectionViewCell.swift
//  Weather
//
//  Created by Sierra 4 on 13/02/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import UIKit

class CityCollectionViewCell: UICollectionViewCell,UITableViewDelegate,UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet var lblCityName: UILabel!
    @IBOutlet var lblWeatherCondition: UILabel!
    @IBOutlet var lblWeatherDegree: UILabel!
    @IBOutlet var lblDay: UILabel!
    @IBOutlet var lblIllusionDay: UILabel!
    @IBOutlet var lblHighTemperature: UILabel!
    @IBOutlet var lblLowTemperature: UILabel!
    @IBOutlet var lblForecast: UILabel!
    @IBOutlet var lblSunriseTime: UILabel!
    @IBOutlet var lblSunsetTime: UILabel!
    @IBOutlet var lblChanceOfRain: UILabel!
    @IBOutlet var lblHumidity: UILabel!
    @IBOutlet var lblWind: UILabel!
    @IBOutlet var lblFeelsLike: UILabel!
    @IBOutlet var lblPercipitation: UILabel!
    @IBOutlet var lblPressure: UILabel!
    @IBOutlet var lblVisibility: UILabel!
    @IBOutlet var lblUvIndex: UILabel!
    
    @IBOutlet var tableViewCellOutlet: UITableView!
    @IBOutlet var hourlyCollectionViewCellOutlet: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tableViewCellOutlet.delegate = self
        tableViewCellOutlet.dataSource = self
        hourlyCollectionViewCellOutlet.delegate = self
        hourlyCollectionViewCellOutlet.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableViewCellOutlet.dequeueReusableCell(withIdentifier: "tableCell") as! WeatherTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 50
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellCollection = hourlyCollectionViewCellOutlet.dequeueReusableCell(withReuseIdentifier: "hourlyWeatherCollectionCell", for: indexPath) as! HourlyWeatherCollectionViewCell
        
        return cellCollection
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80 , height: hourlyCollectionViewCellOutlet.bounds.height)
    }
    
    
}
