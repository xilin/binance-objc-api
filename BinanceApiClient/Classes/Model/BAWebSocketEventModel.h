//
//  BAWebSocketEventModel.h
//  BinanceApiClient
//
//  Created by LinXi on 03/11/2017.
//

#import "BAJSONModel.h"

@interface BAWebSocketEventModel : BAJSONModel

@property(nonatomic, copy) NSString *eventType;
@property(nonatomic, assign) NSInteger eventTime;

@end
