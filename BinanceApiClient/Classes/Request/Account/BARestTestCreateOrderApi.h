//
//  BARestTestCreateOrderApi.h
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BASignedRestRequest.h"
#import "BACreateOrderModel.h"

@interface BARestTestCreateOrderApi : BASignedRestRequest

- (instancetype)initWithCreateOrderParam:(BACreateOrderModel *)createOrderModel;

- (BOOL)isTestSucceed;

@end
