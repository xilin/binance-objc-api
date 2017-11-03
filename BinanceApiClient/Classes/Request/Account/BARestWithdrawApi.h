//
//  BARestWithdrawApi.h
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BASignedRestRequest.h"
#import "BAWithdrawParamModel.h"
#import "BAWithdrawResultModel.h"

@interface BARestWithdrawApi : BASignedRestRequest

@property(nonatomic, strong) BAWithdrawResultModel *resultModel;

- (instancetype)initWithParam:(BAWithdrawParamModel *)paramModel;

@end
