//
//  BADepositHistoryApi.h
//  BinanceApiClient
//
//  Created by LinXi on 04/11/2017.
//

#import "BASignedRestRequest.h"
#import "BAAssetHistoryQueryParamModel.h"
#import "BADepositArrayModel.h"

@interface BADepositHistoryApi : BASignedRestRequest

@property(nonatomic, strong) BADepositArrayModel *depositArrayModel;

- (instancetype)initWithParam:(BAAssetHistoryQueryParamModel *)paramModel;

@end
