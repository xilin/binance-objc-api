//
//  BAWebSocketEventModel.m
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BAWebSocketEventModel.h"

@implementation BAWebSocketEventModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
        @"eventType" : @"e",
        @"eventTime" : @"E"
    }];
}

@end
