//
//  ViewController.m
//  CalorieDataStorage
//
//  Created by Miwa Oshiro on 2013/10/29.
//  Copyright (c) 2013年 Miwa Oshiro. All rights reserved.
//

#import "ViewController.h"
#import "FMDatabase.h"

sqlite3* db;

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    
    //DBファイルのパス
    NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES );
    NSString *dir   = [paths objectAtIndex:0];
    
    //DBファイルがあるかどうか確認
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    
    
    
    if (![fileManager fileExistsAtPath:[dir stringByAppendingPathComponent:@"diet.db"]])
    {
        //なければ新規作成
        FMDatabase *db= [FMDatabase databaseWithPath:[dir stringByAppendingPathComponent:@"diet.db"]];
        
        NSString *createCalorieDataTable = @"CREATE TABLE calorie_data (id INTEGER PRIMARY KEY AUTOINCREMENT,calorie_title TEXT,calorie_cal INTEGER,calorie_num INTEGER,date TEXT);";
        NSString *createExerciseDataTable = @"CREATE TABLE exercise_data (id INTEGER PRIMARY KEY AUTOINCREMENT,exercise_title TEXT,exercise_cal INTEGER,exercise_num INTEGER,date TEXT);";
        
        [db open]; //DB開く
        [db executeUpdate:createCalorieDataTable]; //SQL実行
        [db executeUpdate:createExerciseDataTable]; //SQL実行
        [db close];
    }
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBack:(UIStoryboardSegue *)segue{}



@end
