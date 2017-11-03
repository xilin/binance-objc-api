//
//  BARestClient.h
//  BinanceApiClient
//
//  Created by LinXi on 01/11/2017.
//

#import <Foundation/Foundation.h>
#import "BARestClientProtocol.h"
#import "BARestPingApi.h"
#import "BARestServerTimeApi.h"
#import "BARestOrderBookApi.h"
#import "BARestAggTradesApi.h"
#import "BARestKLinesApi.h"
#import "BARestTicker24HourApi.h"
#import "BARestTickerAllPricesApi.h"
#import "BARestTickerAllBookTickersApi.h"
#import "BARestCreateOrderApi.h"
#import "BARestTestCreateOrderApi.h"
#import "BARestQueryOrderApi.h"
#import "BARestDeleteOrderApi.h"
#import "BARestOpenOrdersApi.h"
#import "BARestAllOrdersApi.h"
#import "BARestAccountInfoApi.h"
#import "BARestMyTradesApi.h"
#import "BARestWithdrawApi.h"
#import "BADepositHistoryApi.h"
#import "BAWithdrawHistoryApi.h"
#import "BARestStartUserStreamApi.h"
#import "BARestKeepAliveUserStreamApi.h"
#import "BARestCloseUserStreamApi.h"
#import "BACommonMacro.h"

@interface BARestClient : NSObject <BARestClientProtocol>

- (instancetype)initWithApiKey:(NSString *)apiKey secret:(NSString *)secret;

@end
