//
//  ViewController.m
//  xml解释XMLReader
//
//  Created by YiGuo on 2017/11/4.
//  Copyright © 2017年 tbb. All rights reserved.
//

#import "ViewController.h"
#import "XMLReader.h"
#import "TBBAppModel.h"
@interface ViewController ()
@property (nonatomic,strong)NSMutableArray *videoArr;
@end

@implementation ViewController
- (NSMutableArray *)videoArr
{
    if (!_videoArr) {
        _videoArr = [NSMutableArray array];
    }
    return _videoArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // 0.请求路径
    NSURL *url = [NSURL URLWithString:@"http://120.25.226.186:32812/video?type=XML"];
    
    // 1.创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 2.发送请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSError *error = nil;
        NSDictionary *video = [XMLReader dictionaryForXMLData:data error:&error];
        NSDictionary *dict = video[@"videos"];
        NSArray *array = dict[@"video"];
        for (NSDictionary *dict in array) {
            TBBAppModel *appModel = [TBBAppModel appWithDict:dict];
            [self.videoArr addObject:appModel];
        }
        TBBAppModel *app = [[TBBAppModel alloc] init];
        app = self.videoArr[3];
        NSLog(@"result : %@",app.name);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
