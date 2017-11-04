//
//  ViewController.m
//  XML解释GDataXML
//
//  Created by YiGuo on 2017/11/4.
//  Copyright © 2017年 tbb. All rights reserved.
//

#import "ViewController.h"
#import "GDataXML/GDataXMLNode.h"
#import "TBBVideoModel.h"
@interface ViewController ()
//视频数据
@property (nonatomic, strong) NSMutableArray *videoArr;
@end

@implementation ViewController
-(NSMutableArray *)videoArr
{
    if (!_videoArr) {
        _videoArr = [NSMutableArray array];
    }
    return _videoArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.请求路径
    NSURL *url = [NSURL URLWithString:@"http://120.25.226.186:32812/video?type=XML"];
    // 2.创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    // 3.发送请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        // 加载整个文档
        GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:data options:0 error:nil];
        // 获得所有video元素
        NSArray *elements = [doc.rootElement elementsForName:@"video"];
        //根据kvc取出对应该键值转为模型
        for (GDataXMLElement *ele in elements) {
            TBBVideoModel *video = [[TBBVideoModel alloc] init];
            video.name = [ele attributeForName:@"name"].stringValue;
            video.url = [ele attributeForName:@"url"].stringValue;
            video.image = [ele attributeForName:@"image"].stringValue;
            video.length = [ele attributeForName:@"length"].stringValue.integerValue;
            [self.videoArr addObject:video];
        }
        NSLog(@"");
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
