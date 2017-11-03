//
//  BAAggTradeEventModel.m
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BAAggTradeEventModel.h"

@implementation BAAggTradeEventModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
        @"eventType" : @"e",
        @"eventTime" : @"E",
        @"symbol" : @"s",
        @"aggregatedTradeId" : @"a",
        @"price" : @"p",
        @"quantity" : @"q",
        @"firstBreakdownTradeId" : @"f",
        @"lastBreakdownTradeId" : @"l",
        @"tradeTime" : @"T",
        @"isBuyerMaker" : @"m"
    }];
}

@end
