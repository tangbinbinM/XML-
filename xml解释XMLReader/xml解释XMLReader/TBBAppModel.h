//
//  TBBAppModel.h
//  多图片下载
//
//  Created by YiGuo on 2017/10/26.
//  Copyright © 2017年 tbb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TBBAppModel : NSObject
@property (nonatomic ,copy)NSString *ID;
/** 图标 */
@property (nonatomic, copy) NSString *image;
/** 下载量 */
@property (nonatomic, copy) NSString *length;
/** 名字 */
@property (nonatomic, copy) NSString *name;

@property (nonatomic ,copy)NSString *url;

+ (instancetype)appWithDict:(NSDictionary *)dict;
@end
