//
//  BAWithdrawHistoryApi.h
//  BinanceApiClient
//
//  Created by LinXi on 04/11/2017.
//

#import "BASignedRestRequest.h"
#import "BAAssetHistoryQueryParamModel.h"
#import "BAWithdrawArrayModel.h"

@interface BAWithdrawHistoryApi : BASignedRestRequest

@property(nonatomic, strong) BAWithdrawArrayModel *withdrawArrayModel;

- (instancetype)initWithParam:(BAAssetHistoryQueryParamModel *)paramModel;

@end
