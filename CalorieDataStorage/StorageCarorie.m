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

sqlite3* db;


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
        
        NSString *sql = @"CREATE TABLE calorie_data (id INTEGER PRIMARY KEY AUTOINCREMENT,calorie_title TEXT,calorie_cal INTEGER,calorie_num INTEGER,date TEXT);";
        
        [db open]; //DB開く
        [db executeUpdate:sql]; //SQL実行
        [db close];
    }


}


- (IBAction)calorieSave:(id)sender {


    NSString *calorie_title = self.calorieTitle.text;
    
    float calorie_cal_f = [self.calorieCal.text floatValue];
    NSNumber *calorie_cal = [NSNumber numberWithFloat:calorie_cal_f];
    
    float calorie_num_f = [self.calorieCal.text floatValue];
    NSNumber *calorie_num = [NSNumber numberWithFloat:calorie_num_f];
    

    NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES );
    NSString *dir   = [paths objectAtIndex:0];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    

    
    
    if ([fileManager fileExistsAtPath:[dir stringByAppendingPathComponent:@"calorie_data.db"]])
    {
        FMDatabase *db= [FMDatabase databaseWithPath:[dir stringByAppendingPathComponent:@"calorie_data.db"]];
        
        [db open]; //DB開く
        
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        df.dateFormat  = @"yyyy-MM-dd HH:mm:ss";
        NSString *strDate = [df stringFromDate:[NSDate date]];
        
        [db executeUpdate:@"insert into calorie_data (calorie_title,calorie_cal,calorie_num,date) values (?,?,?,?);",calorie_title,calorie_cal,calorie_num,strDate];
        
        NSLog(@"Error %@ - %d", [db lastErrorMessage], [db lastErrorCode]);
        [db close];
    }

    
    
    
}
@end
