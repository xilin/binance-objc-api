//
//  BAOrderBookEntryModel.h
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BAJSONModel.h"

@interface BAOrderBookEntryModel : BAJSONModel

@property(nonatomic, copy) NSString *price;
@property(nonatomic, copy) NSString *qty;

@end
