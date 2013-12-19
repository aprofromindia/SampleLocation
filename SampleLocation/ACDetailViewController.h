//
//  ACDetailViewController.h
//  SampleLocation
//
//  Created by Choudhury, Apratim on 16-12-13.
//  Copyright (c) 2013 Apro. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit.MKMapView;

@interface ACDetailViewController : UIViewController <MKMapViewDelegate>{
    IBOutlet UILabel * __weak _nameLabel;
    IBOutlet UILabel * __weak _contactLabel;
    IBOutlet UILabel * __weak _ratingLabel;
    IBOutlet UISwitch * __weak _verifiedSwitch;
    IBOutlet MKMapView * __weak _mapView;
}

@property (nonatomic, copy) NSDictionary *displayDict;

@end
