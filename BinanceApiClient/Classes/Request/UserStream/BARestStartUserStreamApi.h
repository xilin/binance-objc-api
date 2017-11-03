//
//  BARestStartUserStreamApi.h
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import "BAApiKeyRestRequest.h"

@interface BARestStartUserStreamApi : BAApiKeyRestRequest

@property(nonatomic, copy) NSString *listenKey;

@end

