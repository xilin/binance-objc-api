//
//  BADepthEventModel.h
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BAWebSocketEventModel.h"
#import "BAOrderBookEntryModel.h"

@interface BADepthEventModel : BAWebSocketEventModel

@property(nonatomic, copy) NSString *symbol;
@property(nonatomic, assign) NSInteger updateId;
@property(nonatomic, strong) NSArray<BAOrderBookEntryModel *> *bidDepthDeltaArray;
@property(nonatomic, strong) NSArray<BAOrderBookEntryModel *> *askDepthDeltaArray;

@end
