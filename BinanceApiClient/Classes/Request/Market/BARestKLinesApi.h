//
//  BARestKLinesApi.h
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import "BARestRequest.h"
#import "BAKLineModel.h"

@interface BARestKLinesApi : BARestRequest

@property(nonatomic, strong) NSArray<BAKLineModel *> *kLineArray;

- (instancetype)initWithSymbol:(NSString *)symbol
                kKLineInterval:(kKLineInterval)interval
                     startTime:(NSInteger)startTime
                       endTime:(NSInteger)endTime
                         limit:(NSInteger)limit;

@end
