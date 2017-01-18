//
//  ViewController.m
//  TipCalculator
//
//  Created by  Steve Carlson (Media Engineering) on 1/17/17.
//  Copyright © 2017 Steve Carlson. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tip Calculator";
    [self updateValues];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (IBAction)onValueChange:(UISegmentedControl *)sender {
    [self updateValues];
}

- (void)updateValues {
    float BillAmount = [self.billTextField.text floatValue];
    
    NSArray *tipValues = @[@(0.15), @(0.20), @(0.25)];
    
    float TipAmount = [tipValues[self.tipControl.selectedSegmentIndex] floatValue] * BillAmount;
    float TotalAmount = BillAmount + TipAmount;
    
    // Update the UI
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", TipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", TotalAmount];
}

@end
