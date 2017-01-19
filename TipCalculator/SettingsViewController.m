//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by  Steve Carlson (Media Engineering) on 1/18/17.
//  Copyright © 2017 Steve Carlson. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear: (BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    long tipDefault = [defaults integerForKey:@"tipPercent"];

    // Set the default tip amount
    self.tipControl.selectedSegmentIndex = tipDefault;
}

- (IBAction)onTipChanged:(UISegmentedControl *)sender {
    long selectedTip = self.tipControl.selectedSegmentIndex;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    [defaults setFloat:selectedTip forKey:@"tipPercent"];
    [defaults synchronize];
    
    NSLog(@"Tip default changed to %ld", selectedTip);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
