//
//  AppManager.h
//  iOSAutomationTestApp
//
//  Created by Chanikya Mandapathi on 9/12/16.
//  Copyright © 2016 CanNMobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppManager : NSObject

@property (nonatomic, assign) BOOL      isImageUploaded;   // always assign image uploaded status to this property for calabash-backdoor method
@property (nonatomic, assign) NSInteger selectedPickerRow; // To track selected picker row
@property (nonatomic, strong) NSDate    *selectedDate;     // To track selected date picker
@property (nonatomic, assign) NSInteger selectedRow1ForMultiPicker; // To track selected row 1 of multi picker
@property (nonatomic, assign) NSInteger selectedRow2ForMultiPicker; // To track selected row 2 of multi picker

+ (instancetype)sharedInstance;

@end
