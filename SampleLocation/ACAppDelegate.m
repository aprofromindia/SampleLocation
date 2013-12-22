//
//  ACAppDelegate.m
//  SampleLocation
//
//  Created by Choudhury, Apratim on 7-12-13.
//  Copyright (c) 2013 Apro. All rights reserved.
//

#import "ACAppDelegate.h"
#import "FSOAuth.h"


@implementation ACAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    _locMgr = [[CLLocationManager alloc] init];
    _locMgr.delegate = self;
    _locMgr.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    _locMgr.distanceFilter = kGPSDistanceFilter;
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    if ([CLLocationManager locationServicesEnabled]) {
        [_locMgr stopUpdatingLocation];
    }else{
        [[[UIAlertView alloc] initWithTitle:@"Location service error" message:@"Please enable location services from system settings." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
    }
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user
    [_locMgr startUpdatingLocation];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    
    // FS token retrieval
    [FSOAuth requestAccessTokenForCode:[FSOAuth accessCodeForFSOAuthURL:url error:nil] clientId:kFSClientID callbackURIString:kFSRedirectURI clientSecret:kFSClientSecret completionBlock:^(NSString *authToken, BOOL requestCompleted, FSOAuthErrorCode errorCode) {
        
        if (authToken) {
            _FSAuthTokenedPostURL = [NSString stringWithFormat:@"%@%@", kFSAddURL, authToken];
        }
        
    }];
    return YES;
}

#pragma mark - CLLocationManagerDelegate methods

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    if ([locations count] > 0) {
        _lastLocation = [locations lastObject];
        [[NSNotificationCenter defaultCenter] postNotification:[[NSNotification alloc] initWithName:kLocationFound object:nil userInfo:nil]];
    }
}

@end
