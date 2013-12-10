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

@property (strong, nonatomic) CLLocation *lastLocation;
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSString *FSAuthTokenedPostURL;

@end
