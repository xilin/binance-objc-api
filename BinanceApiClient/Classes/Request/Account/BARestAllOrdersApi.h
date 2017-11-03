//
//  BARestAllOrdersApi.h
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import "BASignedRestRequest.h"
#import "BAOrderModel.h"

@interface BARestAllOrdersApi : BASignedRestRequest

@property(nonatomic, strong) NSArray<BAOrderModel *> *orderArray;

- (instancetype)initWithSymbol:(NSString *)symbol
                       orderId:(NSInteger)orderId
                         limit:(NSInteger)limit
                    recvWindow:(NSInteger)recvWindow;

@end
