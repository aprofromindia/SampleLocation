//
//  ACDetailViewController.m
//  SampleLocation
//
//  Created by Choudhury, Apratim on 16-12-13.
//  Copyright (c) 2013 Apro. All rights reserved.
//

#import "ACDetailViewController.h"

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
    
    _nameLabel.text = [_displayDict objectForKey:@"name"];
    _contactLabel.text = [_displayDict objectForKey:@""];
    [_verifiedSwitch setSelected:[_displayDict objectForKey:@"verified"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
