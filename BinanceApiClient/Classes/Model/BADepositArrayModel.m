//
//  BADepositArrayModel.m
//  BinanceApiClient
//
//  Created by LinXi on 04/11/2017.
//

#import "BADepositArrayModel.h"

@implementation BADepositRecordModel

@end

@implementation BADepositArrayModel

+ (Class)classForCollectionProperty:(NSString *)propertyName {
    if ([propertyName isEqualToString:@"depositList"]) {
        return [BADepositRecordModel class];
    }
    return nil;
}

@end
