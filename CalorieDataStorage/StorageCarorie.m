//
//  StorageCarorie.m
//  CalorieDataStorage
//
//  Created by Miwa Oshiro on 2013/10/30.
//  Copyright (c) 2013年 Miwa Oshiro. All rights reserved.
//

#import "StorageCarorie.h"
#import "FMDatabase.h"

@interface StorageCarorie ()

@end

@implementation StorageCarorie;
@synthesize calorieTitle;
@synthesize calorieCal;
@synthesize calorieNum;

sqlite3* _db;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //DBファイルのパス
    NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES );
    NSString *dir   = [paths objectAtIndex:0];
    
    //DBファイルがあるかどうか確認
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:[dir stringByAppendingPathComponent:@"calorie_data.db"]])
    {
        //なければ新規作成
        FMDatabase *db= [FMDatabase databaseWithPath:[dir stringByAppendingPathComponent:@"calorie_data.db"]];
        
        NSString *sql = @"CREATE TABLE calorie_data (id INTEGER PRIMARY KEY AUTOINCREMENT,calorie_title TEXT,calorie_cal INTEGER,calorie_num INTEGER);";
        
        [db open]; //DB開く
        [db executeUpdate:sql]; //SQL実行
        [db close];
    }

}


@end
