//
//  BARestDeleteOrderApi.h
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BARestQueryOrderApi.h"
#import "BADeleteOrderResultModel.h"

@interface BARestDeleteOrderApi : BARestQueryOrderApi

@property(nonatomic, strong) BADeleteOrderResultModel *resultModel;

@end
