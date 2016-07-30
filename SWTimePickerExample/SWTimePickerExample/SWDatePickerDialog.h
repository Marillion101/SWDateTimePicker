//
//  SWDatePickerDialog.h
//  Donesistant
//
//  Created by Simon Walter on 24.07.16.
//  Copyright © 2016 Simon Walter. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SWDatePickerDialogDelegate

- (void) datePickerDialogDidCancel;
- (void) datePickerDialogDidFinishWithDate: (NSDate *) date;

@end

@interface SWDatePickerDialog : UIView

@property UIDatePicker *datePicker;
@property UIToolbar *toolbar;

@property UIColor *toolbarBackgroundColor;
@property UIColor *datePickerBackgroundColor;
@property int toolbarHeight;

@property (weak) id <SWDatePickerDialogDelegate> delegate;
@property (weak) UITextField *textField;

- (id) initWithDatePickerMode: (UIDatePickerMode) datePickerMode;

@end
