//
//  BAOrderTradeUpdateEventModel.m
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BAOrderTradeUpdateEventModel.h"

@implementation BAOrderTradeUpdateEventModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
        @"eventType" : @"e",
        @"eventTime" : @"E",
        @"symbol" : @"s",
        @"latestClientOrderId" : @"c",
        @"side" : @"S",
        @"orderType" : @"o",
        @"timeInForce" : @"f",
        @"originalQuantity" : @"q",
        @"price" : @"p",
        @"executionType" : @"x",
        @"orderGotFilled" : @"X",
        @"orderId" : @"i",
        @"quantityOfLastFilledTrade" : @"l",
        @"accumulatedQuantity" : @"z",
        @"priceOfLastFilledTrade" : @"L",
        @"commission" : @"n",
        @"asset" : @"N",
        @"tradeTime" : @"T",
        @"tradeId" : @"t",
        @"isBuyerMaker" : @"m"
    }];
}

@end
