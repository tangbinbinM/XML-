//
//  ViewController.m
//  xml解释SAX
//
//  Created by YiGuo on 2017/11/4.
//  Copyright © 2017年 tbb. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSXMLParserDelegate>
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
    //发送请求
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        //创建XML解析器
        NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
        //设置代理
        parser.delegate = self;
        //开始解析
        [parser parse];
    }];
}

#pragma mark - <NSXMLParserDelegate>
//开始解释XML
-(void)parserDidStartDocument:(NSXMLParser *)parser{
    NSLog(@"-start---%s--",__func__);
}
//解析到某个元素的开头（比如解析<videos>）
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    if ([elementName isEqualToString:@"videos"]) return;
    //这里的attributeDict对象可以利用MJExtension等技术转为模型
    [self.videoArr addObject:attributeDict];
    NSLog(@"dict%@",attributeDict);
}
//解析到某个元素的结尾（比如解析</videos>）
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
        NSLog(@"didEndElement - %@", elementName);
}
//开始解释XML结束
-(void)parserDidEndDocument:(NSXMLParser *)parser{
    NSLog(@"--videoArr:%@",self.videoArr);
    NSLog(@"-end---%s--",__func__);
}
#pragma mark - <NSXMLParserDelegate>end


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
