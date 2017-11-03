//
//  BAWithdrawArrayModel.m
//  BinanceApiClient
//
//  Created by LinXi on 04/11/2017.
//

#import "BAWithdrawArrayModel.h"

@implementation BAWithdrawRecordModel

@end

@implementation BAWithdrawArrayModel

+ (Class)classForCollectionProperty:(NSString *)propertyName {
    if ([propertyName isEqualToString:@"withdrawList"]) {
        return [BAWithdrawRecordModel class];
    }
    return nil;
}

@end
