# CPRingChart

[![CI Status](https://img.shields.io/travis/44949134/CPRingChart.svg?style=flat)](https://travis-ci.org/44949134/CPRingChart)
[![Version](https://img.shields.io/cocoapods/v/CPRingChart.svg?style=flat)](https://cocoapods.org/pods/CPRingChart)
[![License](https://img.shields.io/cocoapods/l/CPRingChart.svg?style=flat)](https://cocoapods.org/pods/CPRingChart)
[![Platform](https://img.shields.io/cocoapods/p/CPRingChart.svg?style=flat)](https://cocoapods.org/pods/CPRingChart)

## Installation

CPRingChart is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CPRingChart'
```

## Usage

**1. Using Storyboard / Interface Builder**

    - Drop a UIView into your Storyboard file.
    - Change its class to `CPRingChart`.
    - Link it to your ViewController.swift.
    - Set the properties mentioned below.
    - Call `reloadChart()` method of your `CPRingChart` instance (ie, IBOutlet).

You can change the following properties:

- ``` sections : Double ``` 
  -  `required`
  -  `default = 0`
  -  Number of sections or number of rings in the chart
  
- ``` values : [Double] ```
  - `required`
  - `default = [Double]()`
  - Holds the list of values corresponding to the ring's progress.
  - Can be any value. Not necessary to sum to 100.
    
- ```fillColors = [UIColor]```
  - `required`
  - `default = [UIColor]()`
  - List of ring fill colors  
  - Count should be equal to `sections`

- `spacing : Double`
  - `default = 0.05` (ie 5%)
  - Spacing between the rings.
  - Range : 0 to 1
  - Values should be in percentage. ie, `spacing = 0.05` = 5% spacing

- `ringWidth : CGFloat`
  - `default = 10`
  - Width of a ring
    
- `roundedCap : Bool`
  - `default = true`
  - True to make cap rounded
    
- `centerFillColor : UIColor`
  - `default = UIColor.clear`
  - Inner circle fill color for all charts.


## Screenshots

<img width="267" alt="Screenshot 2021-08-10 at 6 06 36 PM" src="https://user-images.githubusercontent.com/44949134/128867848-01d36a47-a21c-47d6-a2bc-e1dfb8e143df.png">

## Author

Subhronil Saha, subhronilsaha26@gmail.com

## License

CPRingChart is available under the MIT license. See the LICENSE file for more info.
