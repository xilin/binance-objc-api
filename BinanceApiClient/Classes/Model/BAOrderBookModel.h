//
//  BAOrderBookModel.h
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import "BAJSONModel.h"
#import "BAOrderBookEntryModel.h"

@interface BAOrderBookModel : BAJSONModel

@property(nonatomic, assign) NSInteger lastUpdateId;
@property(nonatomic, strong) NSArray<BAOrderBookEntryModel *> *bids;
@property(nonatomic, strong) NSArray<BAOrderBookEntryModel *> *asks;

@end
