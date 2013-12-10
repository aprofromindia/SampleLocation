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
    
    IBOutlet UITextField *_nameTxtField;
    IBOutlet UITextField *_addressTxtField;
    IBOutlet UITextField *_cityTxtField;
    IBOutlet UITextField *_zipTxtField;
    IBOutlet UITextField *_phnTxtField;
    UITextField *_currentTxtField;
    
    IBOutlet UIButton *_uploadBtn;
    NSMutableDictionary *_postDict;
    ACAppDelegate *_appDelegate;
}

- (IBAction) uploadBtnPressed;
- (IBAction) nameFieldUpdated:(id)sender;
- (void) updatePostLocParam;

@end
