//
//  ACDetailViewController.m
//  SampleLocation
//
//  Created by Choudhury, Apratim on 16-12-13.
//  Copyright (c) 2013 Apro. All rights reserved.
//

#import "ACDetailViewController.h"
@import MapKit.MKMapItem;

@interface ACDetailViewController ()

@end

@implementation ACDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    _nameLabel.text = _displayDict[@"name"];
    _contactLabel.text = _displayDict [@""];
    [_verifiedSwitch setSelected:[_displayDict[@"verified"] boolValue]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)mapBtnPressed{
    
    Class mapItemClass = [MKMapItem class];
    
    if (mapItemClass && [mapItemClass respondsToSelector:@selector(openMapsWithItems:launchOptions:)]) {
        
        NSDictionary *location = _displayDict[@"location"];
        CLLocationCoordinate2D locationCoord;
        
        if (location) {
            locationCoord.latitude = [location[@"lat"] doubleValue];
            locationCoord.longitude = [location[@"lng"] doubleValue];
        }
        
        MKPlacemark *placeMark = [[MKPlacemark alloc] initWithCoordinate:locationCoord addressDictionary:nil];
        MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placeMark];
        mapItem.name = _displayDict[@"name"];
        [mapItem openInMapsWithLaunchOptions:nil];
    }
}

@end
