//
//  BASignedRestRequest.m
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import "BASignedRestRequest.h"
#import <YYCategories/NSString+YYAdd.h>

@implementation BASignedRestRequest

- (NSString *)requestUrl {
    return [NSString stringWithFormat:@"%@?%@&signature=%@", self.requestUrlWithoutSignature, self.queryStringWithoutSignature, self.signature];
}

- (NSString *)requestUrlWithoutSignature {
    return @"";
}

- (NSString *)signature {
    return [self signWithData:[self queryStringWithoutSignature] key:self.apiSecret];
}

- (NSDictionary *)requestArgumentWithoutSignature {
    return @{};
}

- (NSString *)queryStringWithoutSignature {
    NSDictionary *requestArgument = [self requestArgumentWithoutSignature];
    NSMutableString *toSignData = [NSMutableString string];
    [requestArgument enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSString *prefix = @"";
        if (STRING_HAS_VALUE(toSignData)) {
            prefix = @"&";
        }
        [toSignData appendFormat:@"%@%@=%@", prefix, key, obj];
    }];
    return toSignData;
}

- (NSString *)signWithData:(NSString *)data key:(NSString *)key {
    return [data hmacSHA256StringWithKey:key];
}

@end
