//
//  XMGVideo.h
//  01-掌握-JSON解析
//
//  Created by xiaomage on 15/7/13.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TBBVideoModel : NSObject
/** ID */
@property (nonatomic, assign) NSInteger ID;
/** 视频名字 */
@property (nonatomic, copy) NSString *name;
/** 视频时长 */
@property (nonatomic, assign) NSInteger length;
/** 视频图片 */
@property (nonatomic, copy) NSString *image;
/** 视频文件路径 */
@property (nonatomic, copy) NSString *url;
@end
