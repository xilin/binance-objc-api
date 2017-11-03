//
//  BARestQueryOrderApi.h
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BASignedRestRequest.h"
#import "BAQueryOrderParamModel.h"
#import "BAOrderModel.h"

@interface BARestQueryOrderApi : BASignedRestRequest

@property(nonatomic, strong) BAOrderModel *orderModel;

- (instancetype)initWithParam:(BAQueryOrderParamModel *)paramModel;

@end
