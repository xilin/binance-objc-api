//
//  BARestCreateOrderApi.h
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BARestTestCreateOrderApi.h"
#import "BACreateOrderResultModel.h"

@interface BARestCreateOrderApi : BARestTestCreateOrderApi

@property(nonatomic, strong) BACreateOrderResultModel *createOrderResultModel;

@end
