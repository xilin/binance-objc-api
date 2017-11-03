//
//  BAKLineEventModel.m
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BAKLineEventModel.h"

@implementation BAKLineEventBarDetailModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:
                                      @{ @"startTime" : @"t",
                                         @"endTime" : @"T",
                                         @"symbol" : @"s",
                                         @"interval" : @"i",
                                         @"firstTradeId" : @"f",
                                         @"lastTradeId" : @"L",
                                         @"open" : @"o",
                                         @"close" : @"c",
                                         @"high" : @"h",
                                         @"low" : @"l",
                                         @"volume" : @"v",
                                         @"numberOfTrades" : @"n",
                                         @"isFinal" : @"x",
                                         @"quoteVolume" : @"q",
                                         @"volumeOfActiveBuy" : @"V",
                                         @"quoteVolumeOfActiveBuy" : @"Q" }];
}

@end

@implementation BAKLineEventModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
        @"eventType" : @"e",
        @"eventTime" : @"E",
        @"symbol" : @"s",
        @"barDetail" : @"k"
    }];
}

@end
