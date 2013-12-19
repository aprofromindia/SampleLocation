//
//  ACFirstViewController.h
//  SampleLocation
//
//  Created by Choudhury, Apratim on 7-12-13.
//  Copyright (c) 2013 Apro. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ACAppDelegate;

@interface ACFirstViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>{
    NSArray *_venues;
    ACAppDelegate *_appDelegate;
}

- (void) fetchFSData;

@end
