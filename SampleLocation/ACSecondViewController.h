//
//  ACSecondViewController.h
//  SampleLocation
//
//  Created by Choudhury, Apratim on 7-12-13.
//  Copyright (c) 2013 Apro. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ACAppDelegate;

@interface ACSecondViewController : UIViewController <UITextFieldDelegate>{
    
    IBOutlet UITextField * __weak _nameTxtField;
    IBOutlet UITextField * __weak _addressTxtField;
    IBOutlet UITextField * __weak _cityTxtField;
    IBOutlet UITextField * __weak _zipTxtField;
    IBOutlet UITextField * __weak _phnTxtField;
    UITextField * __weak _currentTxtField;
    
    IBOutlet UIButton * __weak _uploadBtn;
    NSMutableDictionary *_postDict;
    ACAppDelegate *_appDelegate;
}

- (IBAction) uploadBtnPressed;
- (IBAction) nameFieldUpdated:(id)sender;
- (void) updatePostLocParam;

@end
