//
//  PickersViewController.m
//  iOSAutomationTestApp
//
//  Created by Chanikya Mandapathi on 8/9/16.
//  Copyright © 2016 CanNMobile. All rights reserved.
//

#import "PickersViewController.h"

@interface PickersViewController () <UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic, strong) NSArray  *pickerData;
@property (nonatomic, strong) NSArray  *multiPickerData1;
@property (nonatomic, strong) NSArray  *multiPickerData2;
@end

@implementation PickersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pickerData = @[@"Tealeaf", @"Digital Analytics", @"Watson", @"MobileFirst", @"sdsd", @"xcxc", @"erer"];
    self.multiPickerData1 = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7"];
    self.multiPickerData2 = @[@"00", @"15", @"30", @"45", @"60", @"75", @"90"];
    
    self.pickerView.delegate   = self;
    self.pickerView.dataSource = self;
    self.multiCompPicker.delegate   = self;
    self.multiCompPicker.dataSource = self;
}

- (void) viewWillAppear:(BOOL)animated {
    [AppManager sharedInstance].selectedPickerRow = 2;
    [AppManager sharedInstance].selectedRow1ForMultiPicker = 2;
    [AppManager sharedInstance].selectedRow2ForMultiPicker = 2;
    
    [self.pickerView selectRow:[AppManager sharedInstance].selectedPickerRow inComponent:0 animated:NO];
    [self.multiCompPicker selectRow:[AppManager sharedInstance].selectedRow1ForMultiPicker inComponent:0 animated:NO];
    [self.multiCompPicker selectRow:[AppManager sharedInstance].selectedRow2ForMultiPicker inComponent:1 animated:NO];
//    if ([AppManager sharedInstance].selectedDate) {
//        self.datePicker.date = [AppManager sharedInstance].selectedDate;
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- PickerView delegate methods

// The number of columns of data
- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if ([pickerView isEqual:self.pickerView]) {
        return 1;
    }
    return 2;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if ([pickerView isEqual:self.pickerView]) {
        return self.pickerData.count;;
    }
    return self.multiPickerData1.count;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    CGFloat width = pickerView.frame.size.width;
    
    NSUInteger count = [self numberOfComponentsInPickerView:pickerView];
    if(count > 1){
        width /= count;// - 5.0; ? figure this out
    }
    
    return width;
}

// The data to return for the row and component (column) that's being passed in.. Obsolete becoz of viewForRow: delegate method below
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if ([pickerView isEqual:self.pickerView]) {
        return self.pickerData[row];
    }
    else {
        if (component == 0) {
            return self.multiPickerData1[row];
        }
        else {
            return self.multiPickerData2[row];
        }
    }
}

// Catpure the picker view selection
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // This method is triggered whenever the user makes a change to the picker selection.
    if ([pickerView isEqual:self.pickerView]) {
        [AppManager sharedInstance].selectedPickerRow = row;
        UILabel *labelSelected = (UILabel*)[pickerView viewForRow:row forComponent:component];
        [labelSelected setTextColor:[UIColor whiteColor]];
    }
    else {
        if (component == 0) {
            [AppManager sharedInstance].selectedRow1ForMultiPicker = row;
        }
        else {
            [AppManager sharedInstance].selectedRow2ForMultiPicker = row;
        }
    }
}

- (IBAction)datePickerValueChanged:(UIDatePicker *)sender {
    [AppManager sharedInstance].selectedDate = sender.date;
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *label = (UILabel*)view;
    
    if (!label)
    {
        if ([pickerView isEqual:self.pickerView]) {
            label= [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [pickerView rowSizeForComponent:component].width, [pickerView rowSizeForComponent:component].height)];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor grayColor];
            label.text = self.pickerData[row];
        }
        else {
            if (component == 0) {
                label= [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [pickerView rowSizeForComponent:component].width, [pickerView rowSizeForComponent:component].height)];
                label.textAlignment = NSTextAlignmentCenter;
                label.text = self.multiPickerData1[row];
            }
            else {
                label= [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [pickerView rowSizeForComponent:component].width, [pickerView rowSizeForComponent:component].height)];
                label.textAlignment = NSTextAlignmentCenter;
                label.text = self.multiPickerData2[row];
            }
        }
    }
    
    return label;
}

@end
