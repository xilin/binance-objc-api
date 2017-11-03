//
//  BARestAggTradesApi.h
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import "BARestRequest.h"
#import "BAAggTradeModel.h"

@interface BARestAggTradesApi : BARestRequest

@property(nonatomic, strong) NSArray<BAAggTradeModel *> *aggTradeArray;

- (instancetype)initWithSymbol:(NSString *)symbol
                        fromId:(NSInteger)fromId
                     startTime:(NSInteger)startTime
                       endTime:(NSInteger)endTime
                         limit:(NSInteger)limit;

@end
