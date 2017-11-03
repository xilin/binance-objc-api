//
//  BARestOpenOrdersApi.h
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BASignedRestRequest.h"
#import "BAOrderModel.h"

@interface BARestOpenOrdersApi : BASignedRestRequest

@property(nonatomic, strong) NSArray<BAOrderModel *> *orderArray;

- (instancetype)initWithSymbol:(NSString *)symbol
                    recvWindow:(NSInteger)recvWindow;

@end
