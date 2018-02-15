//
//  TextBtnViewController.h
//  iOSAutomationTestApp
//
//  Created by Chanikya Mandapathi on 8/9/16.
//  Copyright © 2016 CanNMobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextBtnViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *btnOutlet;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *btnImage;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *locationBtn;
@property (weak, nonatomic) IBOutlet UISwitch *sdkSwitchOutlet;
- (IBAction) toggleSDKSwitch:(id)sender;
@end
