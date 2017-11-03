//
//  BAAccountUpdateEventModel.m
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BAAccountUpdateEventModel.h"

@implementation BAAssetBalanceModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
        @"asset" : @"a",
        @"availableBalance" : @"f",
        @"lockedByOpenOrders" : @"l"
    }];
}

@end

@implementation BAAccountUpdateEventModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
        @"eventType" : @"e",
        @"eventTime" : @"E",
        @"B" : @"balanceArray"
    }];
}

+ (Class)classForCollectionProperty:(NSString *)propertyName {
    if ([propertyName isEqualToString:@"B"]) {
        return [BAAssetBalanceModel class];
    }
    return nil;
}

@end
