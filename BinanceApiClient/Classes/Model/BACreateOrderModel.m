//
//  BACreateOrderModel.m
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BACreateOrderModel.h"

@implementation BACreateOrderModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
        @"latestClientOrderId" : @"newClientOrderId"
    }];
}

@end
