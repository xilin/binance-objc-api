//
//  BAAssetHistoryQueryParamModel.h
//  BinanceApiClient
//
//  Created by LinXi on 04/11/2017.
//

#import "BAJSONModel.h"

@interface BAAssetHistoryQueryParamModel : BAJSONModel

@property(nonatomic, copy) NSString *asset;
@property(nonatomic, assign) NSInteger status;
@property(nonatomic, assign) NSInteger startTime;
@property(nonatomic, assign) NSInteger endTime;
@property(nonatomic, assign) NSInteger recvWindow;
@property(nonatomic, assign) NSInteger timestamp;

- (NSDictionary *)requestArgument;

@end
