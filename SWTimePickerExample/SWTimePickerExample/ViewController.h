//
//  ViewController.h
//  SWTimePickerExample
//
//  Created by Simon Walter on 30.07.16.
//  Copyright © 2016 Marillion101. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWDatePickerDialog.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *timeTextField;
@property SWDatePickerDialog *dialog;

@end

