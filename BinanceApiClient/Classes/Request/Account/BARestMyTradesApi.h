//
//  BARestMyTradesApi.h
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BASignedRestRequest.h"
#import "BATradeModel.h"

@interface BARestMyTradesApi : BASignedRestRequest

@property(nonatomic, strong) NSArray<BATradeModel *> *tradeArray;

- (instancetype)initWithSymbol:(NSString *)symbol
                        fromId:(NSInteger)fromId
                         limit:(NSInteger)limit
                    recvWindow:(NSInteger)recvWindow;

@end
