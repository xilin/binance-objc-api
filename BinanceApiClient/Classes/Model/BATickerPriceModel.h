//
//  BATickerPriceModel.h
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import "BAJSONModel.h"

@interface BATickerPriceModel : BAJSONModel

@property(nonatomic, copy) NSString *symbol;
@property(nonatomic, copy) NSString *price;

@end
