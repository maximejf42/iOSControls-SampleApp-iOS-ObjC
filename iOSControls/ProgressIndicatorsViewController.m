//
//  ProgressIndicatorsViewController.m
//  iOSAutomationTestApp
//
//  Created by Chanikya Mandapathi on 8/9/16.
//  Copyright © 2016 CanNMobile. All rights reserved.
//

#import "ProgressIndicatorsViewController.h"

@interface ProgressIndicatorsViewController ()
{
    float progress;
}
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIProgressView *progressIndicator;

@end

@implementation ProgressIndicatorsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    progress = 0.0;
    
    [self.activityIndicator startAnimating];
    NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval: 1.0 target: self
                                                    selector: @selector(updateProgressBar) userInfo: nil repeats: YES];
    [timer fire];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) updateProgressBar
{
    if (progress < 1.0) {
        progress = progress + 0.25;
        [self.progressIndicator setProgress:progress];
    }
    else {
        progress = 0.0;
        [self.progressIndicator setProgress:progress];
    }
}

@end
