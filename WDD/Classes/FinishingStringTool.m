//
//  FinishingStringTool.m
//  GoFar
//
//  Created by Pagani on 2019/12/12.
//  Copyright by Pagani. All. All rights reserved.
//

#import "FinishingStringTool.h"
#import <objc/runtime.h>

@implementation UILabel (ClearString)

//重写initialize
+ (void)initialize
{
    // 获取到UILabel中setText对应的method
    Method setText =class_getInstanceMethod([UILabel class], @selector(setText:));
    Method setTextMySelf =class_getInstanceMethod([self class],@selector(setTextHooked:));
    
    // 将目标函数的原实现绑定到setTextOriginalImplemention方法上
    IMP setTextImp =method_getImplementation(setText);
    class_addMethod([UILabel class], @selector(setTextOriginal:), setTextImp,method_getTypeEncoding(setText));
    
    //然后用我们自己的函数的实现，替换目标函数对应的实现
    IMP setTextMySelfImp =method_getImplementation(setTextMySelf);
    class_replaceMethod([UILabel class], @selector(setText:), setTextMySelfImp,method_getTypeEncoding(setText));
    
}


- (void)setTextHooked:(NSString *)invalidString
{
    invalidString =  [invalidString stringByReplacingOccurrencesOfString:@"科创板日报" withString:@"官方"];

    
    invalidString =  [invalidString stringByReplacingOccurrencesOfString:@"链闻ChainNews" withString:@"官方"];
    invalidString =  [invalidString stringByReplacingOccurrencesOfString:@"链闻" withString:@"官方"];
    invalidString =  [invalidString stringByReplacingOccurrencesOfString:@"第一财经" withString:@""];
    invalidString =  [invalidString stringByReplacingOccurrencesOfString:@"商务部" withString:@"平台"];
    invalidString =  [invalidString stringByReplacingOccurrencesOfString:@"BTC.com" withString:@"官方"];
    invalidString =  [invalidString stringByReplacingOccurrencesOfString:@"Tokenview" withString:@"官方"];
//    invalidString =  [invalidString stringByReplacingOccurrencesOfString:@"BTC" withString:@"官方"];
    
    invalidString =  [invalidString stringByReplacingOccurrencesOfString:@"BeInCrypto|" withString:@"官方"];
    
    
    invalidString =  [invalidString stringByReplacingOccurrencesOfString:@"BitcoinExchangeGuide" withString:@"官方"];
    invalidString =  [invalidString stringByReplacingOccurrencesOfString:@"ChainNews" withString:@"官方"];
    invalidString =  [invalidString stringByReplacingOccurrencesOfString:@"期交所" withString:@"的解析"];
    invalidString =  [invalidString stringByReplacingOccurrencesOfString:@"The" withString:@""];
    
//    invalidString =  [invalidString stringByReplacingOccurrencesOfString:@"比特币" withString:@"原油"];

    NSString *regExpStr = @"(据The Feng报道|据币世界消息|据BTC.com数据显示|《何币说》|Tokenview|链闻ChainNews|链闻消息|区块链日报|Coindesk|TokenInsight|财联社|Coinbase|彭博|彭博社|BeInCrypto|TrustNodes|金融投资报|Cointelegraph|金融投资报|据新闻消息|Arnnet|币安|The Feng|ChaiNext|韩联社|BitcoinExchangeGuide|据媒体消息|链闻ChainNews|swissinfo.ch|英为财情Investing.com|《|》|科创板日报|央视财经评论|加密情报局|鸵鸟区块链|金色财经|人民网|山西日报|人民日报海外版|财经网|科技日报|上海证券报|人民日报|鸵鸟|法制|行情周报|行情日报|前沿新闻|英为财情|访问yuanben.io查询|英国金融时报|解放日报|巴比特|比原链研究院|金色|中国|陀螺|金融|中国人民|人民网|人民|Feng|中国今日新闻网|商务部|币查查)";
    invalidString = [invalidString stringByReplacingOccurrencesOfString:regExpStr withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, invalidString.length)];
    
    
    
    
    
    
    NSString *regExpStr2 = @"(获取授权信息|认证|认证|作者官方|作者官方|微信：tuoniao02|微信|来源|共享财经|责任编辑|ID：gongxiangcaijing|对本文亦有贡献|中国税务报|平安证券|新浪财经|第一财经|深链)";
    invalidString = [invalidString stringByReplacingOccurrencesOfString:regExpStr2 withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, invalidString.length)];
    invalidString =  [invalidString stringByReplacingOccurrencesOfString:@"彭博" withString:@"官方"];
    invalidString =  [invalidString stringByReplacingOccurrencesOfString:@"币安" withString:@"官方"];
    invalidString =  [invalidString stringByReplacingOccurrencesOfString:@"韩联社" withString:@"官方"];
    invalidString =  [invalidString stringByReplacingOccurrencesOfString:@"笔记" withString:@""];
    invalidString =  [invalidString stringByReplacingOccurrencesOfString:@"COINBASE" withString:@""];
    invalidString =  [invalidString stringByReplacingOccurrencesOfString:@"Konikko" withString:@""];
    
    invalidString =  [invalidString stringByReplacingOccurrencesOfString:@"财联社" withString:@"官方"];
    invalidString =  [invalidString stringByReplacingOccurrencesOfString:@"区块链日报" withString:@"官方"];
    invalidString =  [invalidString stringByReplacingOccurrencesOfString:@"区块链" withString:@"期货原油"];
    invalidString =  [invalidString stringByReplacingOccurrencesOfString:@"币圈" withString:@"期货"];
    invalidString =  [invalidString stringByReplacingOccurrencesOfString:@"彭博" withString:@"官方"];
    invalidString =  [invalidString stringByReplacingOccurrencesOfString:@"Coinbase|" withString:@"官方"];
    invalidString =  [invalidString stringByReplacingOccurrencesOfString:@"Arnnet" withString:@"官方"];
    [self performSelector:@selector(setTextOriginal:) withObject:invalidString];
}

@end
