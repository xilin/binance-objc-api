//
//  BATradeModel.m
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BATradeModel.h"

@implementation BATradeModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
        @"tradeId" : @"id"
    }];
}

@end
