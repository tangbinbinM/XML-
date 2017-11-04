//
//  TBBAppModel.m
//  多图片下载
//
//  Created by YiGuo on 2017/10/26.
//  Copyright © 2017年 tbb. All rights reserved.
//

#import "TBBAppModel.h"

@implementation TBBAppModel
+ (instancetype)appWithDict:(NSDictionary *)dict
{
    if ([[dict allKeys] containsObject:@"id"]) {
        NSMutableDictionary *mDict = [[NSMutableDictionary alloc] initWithDictionary:dict];
        NSString *Id = dict[@"id"];
        mDict[@"ID"] = Id;
        [mDict removeObjectForKey:@"id"];
        TBBAppModel *app = [[self alloc] init];
        [app setValuesForKeysWithDictionary:[mDict copy]];
        return app;
    }else{
        TBBAppModel *app = [[self alloc] init];
        [app setValuesForKeysWithDictionary:dict];
        return app;
    }

}
@end
