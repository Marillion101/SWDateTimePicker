//
//  SWDatePickerDialog.m
//  Donesistant
//
//  Created by Simon Walter on 24.07.16.
//  Copyright © 2016 Simon Walter. All rights reserved.
//

#import "SWDatePickerDialog.h"

@implementation SWDatePickerDialog


- (id) initWithDatePickerMode: (UIDatePickerMode) datePickerMode
{
    self = [super init];
    if(self)
    {
        // ui customizing: height, and colors
        CGFloat veryLightGray = 225.0/255.0;
        CGFloat lightGray = 200.0/255.0;
        
        self.toolbarHeight = 44;
        self.toolbarBackgroundColor = [UIColor colorWithRed: veryLightGray green:veryLightGray blue:veryLightGray alpha:1.0];
        self.datePickerBackgroundColor = [UIColor colorWithRed: lightGray green:lightGray blue:lightGray alpha:1.0];
        
        // setup datePicker
        self.datePicker = [[UIDatePicker alloc] init];
        self.datePicker.datePickerMode = datePickerMode;
        CGRect pickerFrame = CGRectMake(0, self.toolbarHeight, self.datePicker.frame.size.width, self.datePicker.frame.size.height);
        self.datePicker.frame = pickerFrame;
        self.datePicker.backgroundColor = self.datePickerBackgroundColor;
        
        // set up view
        self.backgroundColor = self.toolbarBackgroundColor;
        self.frame = CGRectMake(0, 0, self.datePicker.frame.size.width, self.datePicker.frame.size.height + self.toolbarHeight);
        
        // setup toolbar
        self.toolbar = [[UIToolbar alloc] init];
        self.toolbar.frame = CGRectMake(0, 0, self.datePicker.frame.size.width, self.toolbarHeight);
        
        // setup toolbar buttons
        UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(toolbarDidCancle)];
        UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *select = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(toolbarDidPickDate)];
        [self.toolbar setItems:[[NSArray alloc] initWithObjects:cancel, space, select, nil]];
        
        // add datepicker and toolbar as subviews
        [self addSubview:self.toolbar];
        [self addSubview:self.datePicker];
        
    }
    return self;
}

-(void) toolbarDidCancle
{
    if(self.delegate)
    {
        [self.delegate datePickerDialogDidCancel];
        
    }
    if(self.textField)
    {
        [self.textField resignFirstResponder];
    }
}

- (void) toolbarDidPickDate
{
    if(self.delegate)
    {
        [self.delegate datePickerDialogDidFinishWithDate:self.datePicker.date];
    }
    if(self.textField)
    {
        [self setDateToTextField];
        [self.textField resignFirstResponder];
    }
}

- (void) setDateToTextField
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateStyle = NSDateFormatterLongStyle;
    dateFormatter.timeStyle = NSDateFormatterLongStyle;
    NSString *dateString = [dateFormatter stringFromDate:self.datePicker.date];
    
    if (self.datePicker.datePickerMode == UIDatePickerModeDate)
    {
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
        dateString = [dateFormatter stringFromDate:self.datePicker.date];
    }
    else if (self.datePicker.datePickerMode == UIDatePickerModeTime)
    {
        dateFormatter.dateStyle = NSDateFormatterNoStyle;
        dateString = [dateFormatter stringFromDate:self.datePicker.date];
    }
    else if (self.datePicker.datePickerMode == UIDatePickerModeCountDownTimer)
    {
        dateFormatter.dateStyle = NSDateFormatterNoStyle;
        NSTimeInterval timeInterval = self.datePicker.countDownDuration;
        NSDateComponentsFormatter *dateComponentsFormatter = [[NSDateComponentsFormatter alloc] init];
        dateComponentsFormatter.allowedUnits = (NSCalendarUnitHour | NSCalendarUnitMinute);
        dateComponentsFormatter.unitsStyle = NSDateComponentsFormatterUnitsStyleFull;
        dateString = [dateComponentsFormatter stringFromTimeInterval:timeInterval];
        
        
    }

    [self.textField setText:dateString];
}

@end
