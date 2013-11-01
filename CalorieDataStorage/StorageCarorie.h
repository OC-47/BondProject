//
//  StorageCarorie.h
//  CalorieDataStorage
//
//  Created by Miwa Oshiro on 2013/10/30.
//  Copyright (c) 2013年 Miwa Oshiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StorageCarorie : UIViewController


@property (strong, nonatomic) IBOutlet UITextField *calorieTitle;
@property (strong, nonatomic) IBOutlet UITextField *calorieCal;
@property (strong, nonatomic) IBOutlet UITextField *calorieNum;

- (IBAction)calorieSave:(id)sender;


@end
