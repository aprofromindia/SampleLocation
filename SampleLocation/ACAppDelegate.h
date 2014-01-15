//
//  ACAppDelegate.h
//  SampleLocation
//
//  Created by Choudhury, Apratim on 7-12-13.
//  Copyright (c) 2013 Apro. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreLocation;

@interface ACAppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate>{
    CLLocationManager * _locMgr;
}
// users last location.
@property (strong, nonatomic) CLLocation *lastLocation;

@property (strong, nonatomic) UIWindow *window;

// 4SQ token
@property (copy, nonatomic) NSString *FSAuthTokenedPostURL;

@end
