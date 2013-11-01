//
//  StorageExercise.h
//  CalorieDataStorage
//
//  Created by Miwa Oshiro on 2013/11/01.
//  Copyright (c) 2013年 Miwa Oshiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StorageExercise : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *exerciseTitle;
@property (strong, nonatomic) IBOutlet UITextField *exerciseCal;
@property (strong, nonatomic) IBOutlet UITextField *exerciseNum;

- (IBAction)exerciseSave:(id)sender;

@end
