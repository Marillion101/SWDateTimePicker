//
//  ViewController.m
//  SWTimePickerExample
//
//  Created by Simon Walter on 30.07.16.
//  Copyright © 2016 Marillion101. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.dialog = [[SWDatePickerDialog alloc] initWithDatePickerMode:UIDatePickerModeDateAndTime];
    self.timeTextField.inputView = self.dialog;
    self.dialog.textField = self.timeTextField;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
