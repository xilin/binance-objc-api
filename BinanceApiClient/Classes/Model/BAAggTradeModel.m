//
//  BAAggTradeModel.m
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import "BAAggTradeModel.h"

@implementation BAAggTradeModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
        @"tradeId" : @"a",
        @"price" : @"p",
        @"quantity" : @"q",
        @"firstTradeId" : @"f",
        @"lastTradeId" : @"l",
        @"timestamp" : @"T",
        @"isBuyerMaker" : @"m",
        @"isBestPriceMatched" : @"M"
    }];
}

@end
