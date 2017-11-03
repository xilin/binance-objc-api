//
//  BAAccountInfoModel.m
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BAAccountInfoModel.h"

@implementation BAAccountBalanceModel

@end

@implementation BAAccountInfoModel

+ (Class)classForCollectionProperty:(NSString *)propertyName {
    if ([propertyName isEqualToString:@"balances"]) {
        return [BAAccountBalanceModel class];
    }
    return nil;
}

@end
