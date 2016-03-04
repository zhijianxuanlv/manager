//
//  ViewController.m
//  PlistchangeJson
//
//  Created by 罗成 on 15/12/29.
//  Copyright © 2015年 罗成. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *fy_proPath = [[NSBundle mainBundle] pathForResource:@"fy_province" ofType:@"json"];
    
    NSString *fy_cityPath = [[NSBundle mainBundle] pathForResource:@"fy_city" ofType:@"json"];
    
    
    NSData *fy_proData = [NSData dataWithContentsOfFile:fy_proPath options:NSDataReadingMappedIfSafe error:nil];
    NSData *fy_cityData = [NSData dataWithContentsOfFile:fy_cityPath options:NSDataReadingMappedIfSafe error:nil];
    
    
    NSMutableDictionary *proDic = [NSJSONSerialization JSONObjectWithData:fy_proData options:NSJSONReadingMutableContainers error:nil];
    
    NSMutableDictionary *cityDic = [NSJSONSerialization JSONObjectWithData:fy_cityData options:NSJSONReadingMutableContainers error:nil];
    
    
    
    
    
    NSMutableArray *proArrays = [NSMutableArray array];
    NSMutableArray *cityArrays = [NSMutableArray array];
    
    
    NSArray *proArray = proDic[@"RECORDS"];
    
    NSArray *cityArray = cityDic[@"RECORDS"];
    
//    "Id":1,
//    "Prov_cd":"110",
//    "Prov_nm":"北京市",
//    "Status":"启用"
    
    for (NSDictionary *dic  in proArray) {
        NSString *Id = [NSString stringWithFormat:@"%@",dic[@"Id"]];
        NSDictionary *pro = @{@"Id":Id,
                              @"Prov_cd":dic[@"Prov_cd"],
                              @"Prov_nm":dic[@"Prov_nm"],
                              @"Status":dic[@"Status"],
                              @"citys":[NSMutableArray array]};
        
        [proArrays addObject:pro];
    }
    
//    "Id":1,
//    "City_cd":"1000",
//    "City_nm":"北京市",
//    "Pid":1,
//    "Status":"启用"
    
    
    for (NSDictionary *dic in cityArray) {
        
        NSString *Pid = [NSString stringWithFormat:@"%@",dic[@"Pid"]];
        NSDictionary *city = @{@"Id":dic[@"Id"],
                               @"City_cd":dic[@"City_cd"],
                               @"City_nm":dic[@"City_nm"],
                               @"Pid":Pid,
                               @"Status":dic[@"Status"]};
        [cityArrays addObject:city];
        
        for (NSDictionary *pro in proArrays) {
            if ([city[@"Pid"] isEqualToString:pro[@"Id"]] ) {
                [pro[@"citys"]addObject:city];
                break;
            }
        }
        
    }
    
    NSLog(@"cityArray => %d",cityArray.count);
    
//    BOOL flag = [proArrays writeToFile:@"/Users/luocheng/Desktop/1.plist" atomically:YES];
//    
//    if(flag) {
//        NSLog(@"ok");
//    } else {
//        NSLog(@"bad");
//    }
//    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
