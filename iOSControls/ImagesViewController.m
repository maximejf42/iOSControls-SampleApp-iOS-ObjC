//
//  ImagesViewController.m
//  iOSAutomationTestApp
//
//  Created by Chanikya on 4/18/17.
//  Copyright © 2017 CanNMobile. All rights reserved.
//

#import "ImagesViewController.h"

@interface ImagesViewController ()

@end

@implementation ImagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Images";
    
    // Added in storyboard
    //self.pdfImageView.image = [UIImage imageNamed:@"watson_pdf"];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"tealeaf" ofType:@"png"];
    NSData *dt = [[NSData alloc] initWithContentsOfFile:filePath];
    self.pngImageView.image = [UIImage imageWithData:dt]; //[[UIImage alloc] initWithData:dt];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
