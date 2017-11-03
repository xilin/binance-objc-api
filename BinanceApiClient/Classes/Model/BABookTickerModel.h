//
//  BABookTickerModel.h
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import "BAJSONModel.h"

@interface BABookTickerModel : BAJSONModel

@property(nonatomic, copy) NSString *symbol;
@property(nonatomic, copy) NSString *bidPrice;
@property(nonatomic, copy) NSString *bidQty;
@property(nonatomic, copy) NSString *askPrice;
@property(nonatomic, copy) NSString *askQty;

@end
