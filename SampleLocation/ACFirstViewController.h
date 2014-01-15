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
    // list of venues.
    NSArray *_venues;
    
    ACAppDelegate *_appDelegate;
}

// function used to fetch 4SQ data.
- (void) fetchFSData;

@end
