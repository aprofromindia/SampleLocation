//
//  ACSecondViewController.m
//  SampleLocation
//
//  Created by Choudhury, Apratim on 7-12-13.
//  Copyright (c) 2013 Apro. All rights reserved.
//

#import "ACSecondViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import "FSOAuth.h"
#import "ACAppDelegate.h"
@import CoreLocation;


@interface ACSecondViewController ()

@end

@implementation ACSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _postDict = [[NSMutableDictionary alloc] initWithCapacity:kNumOfFields];
    
    // start FS authorisation
    [FSOAuth authorizeUserUsingClientId:kFSClientID callbackURIString:kFSRedirectURI allowShowingAppStore:YES];
    _appDelegate = (ACAppDelegate *) [[UIApplication sharedApplication] delegate];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updatePostLocParam) name:kLocationFound object:nil];
    //if location already found setting up post param.
    if (_appDelegate.lastLocation) {
        [[NSNotificationCenter defaultCenter] postNotificationName:kLocationFound object:nil];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction methods

- (void)nameFieldUpdated:(id)sender{
    _uploadBtn.enabled = true;
}


- (void)uploadBtnPressed{
    // resign first responder.
    [_currentTxtField resignFirstResponder];
    
    if ([_nameTxtField.text isEqualToString:@""]) {
        [[[UIAlertView alloc] initWithTitle:@"Error" message:@"Please enter venue name!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        return;
    }else if(![_postDict objectForKey:@"ll"]){
        [[[UIAlertView alloc] initWithTitle:@"Location Error" message:@"Please wait for a location fix, please try again later." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        return;
    }
    
    AFHTTPRequestOperationManager *httpReqMgr = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:_appDelegate.FSAuthTokenedPostURL]];
    [httpReqMgr POST:_appDelegate.FSAuthTokenedPostURL parameters:_postDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //upload success alert message
        [[[UIAlertView alloc] initWithTitle:@"Success" message:@"Venue created successfully!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        //upload failure alert message
        [[[UIAlertView alloc] initWithTitle:@"Upload Failure" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
    }];
}


- (void) updatePostLocParam{
    CLLocationCoordinate2D tmpCoord = _appDelegate.lastLocation.coordinate;
    [_postDict setObject:[NSString stringWithFormat:@"%f,%f", tmpCoord.latitude, tmpCoord.longitude] forKey:@"ll"];
}


#pragma mark - UITextFieldDelegate methods

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    _currentTxtField = textField;
    return YES;
}

// store the post parameters
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    if ([textField isEqual:_nameTxtField]) {
        [_postDict setObject:_nameTxtField.text forKey:@"name"];
        
    }else if ([textField isEqual:_addressTxtField]){
        [_postDict setObject:_addressTxtField.text forKey:@"address"];
        
    }else if ([textField isEqual:_cityTxtField]){
        [_postDict setObject:_cityTxtField.text forKey:@"city"];
        
    }else if ([textField isEqual:_zipTxtField]){
        [_postDict setObject:_zipTxtField.text forKey:@"zip"];
    }else{
        [_postDict setObject:_phnTxtField.text forKey:@"phone"];
    }
}




- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if ([textField isEqual:_nameTxtField]) {
        [_addressTxtField becomeFirstResponder];
        
    }else if ([textField isEqual:_addressTxtField]){
        [_cityTxtField becomeFirstResponder];
        
    }else if ([textField isEqual:_cityTxtField]){
        [_zipTxtField becomeFirstResponder];
        
    }else if ([textField isEqual:_zipTxtField]){
        [_phnTxtField becomeFirstResponder];
    }
    return true;
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
