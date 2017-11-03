//
//  BAApiKeyRestRequest.m
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import "BAApiKeyRestRequest.h"

@implementation BAApiKeyRestRequest

- (nullable NSDictionary<NSString *, NSString *> *)requestHeaderFieldValueDictionary {
    return @{ ENDPOINT_SECURITY_TYPE_APIKEY : self.apiKey ?: @"" };
}

@end
