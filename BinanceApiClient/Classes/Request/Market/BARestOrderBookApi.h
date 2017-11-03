//
//  BARestOrderBookApi.h
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import "BARestRequest.h"
#import "BAOrderBookModel.h"

@interface BARestOrderBookApi : BARestRequest

@property(nonatomic, strong) BAOrderBookModel *orderBookModel;

- (instancetype)initWithSymbol:(NSString *)symbol limit:(NSInteger)limit;

@end
