//
//  BASignedRestRequest.h
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import "BAApiKeyRestRequest.h"

@interface BASignedRestRequest : BAApiKeyRestRequest

@property(nonatomic, copy) NSString *apiSecret;

- (NSString *)requestUrlWithoutSignature;
- (NSDictionary *)requestArgumentWithoutSignature;

@end
