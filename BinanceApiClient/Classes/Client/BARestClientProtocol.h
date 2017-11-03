//
//  BARestClientProtocol.h
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#import <Foundation/Foundation.h>
#import "BARestRequest.h"

@class BACreateOrderModel;
@class BAQueryOrderParamModel;
@class BAWithdrawParamModel;
@class BAAssetHistoryQueryParamModel;

typedef void (^BARestRequestCompleteBlock)(__kindof BARestRequest *request, BOOL isSucceed);

@protocol BARestClientProtocol <NSObject>

// General
- (void)ping:(BARestRequestCompleteBlock)callback;
- (void)serverTime:(BARestRequestCompleteBlock)callback;

// Market
- (void)orderBookWithSymbol:(NSString *)symbol limit:(NSInteger)limit callback:(BARestRequestCompleteBlock)callback;
- (void)aggTradeWithSymbol:(NSString *)symbol
                    fromId:(NSInteger)fromId
                 startTime:(NSInteger)startTime
                   endTime:(NSInteger)endTime
                     limit:(NSInteger)limit
                  callback:(BARestRequestCompleteBlock)callback;
- (instancetype)kLinesWithSymbol:(NSString *)symbol
                        interval:(kKLineInterval)interval
                       startTime:(NSInteger)startTime
                         endTime:(NSInteger)endTime
                           limit:(NSInteger)limit
                        callback:(BARestRequestCompleteBlock)callback;
- (void)ticker24HourWithSymbol:(NSString *)symbol callback:(BARestRequestCompleteBlock)callback;
- (void)tickerAllPricesWithCallback:(BARestRequestCompleteBlock)callback;
- (void)tickerAllBookTickersWithCallback:(BARestRequestCompleteBlock)callback;

// Account
- (void)createOrderWithParam:(BACreateOrderModel *)createOrderModel
                    callback:(BARestRequestCompleteBlock)callback;
- (void)testCreateOrderWithParam:(BACreateOrderModel *)createOrderModel
                        callback:(BARestRequestCompleteBlock)callback;
- (void)queryOrderWithParam:(BAQueryOrderParamModel *)paramModel
                   callback:(BARestRequestCompleteBlock)callback;
- (void)deleteOrderWithParam:(BAQueryOrderParamModel *)paramModel
                    callback:(BARestRequestCompleteBlock)callback;
- (void)openOrdersWithSymbol:(NSString *)symbol
                  recvWindow:(NSInteger)recvWindow
                    callback:(BARestRequestCompleteBlock)callback;
- (void)allOrderWithSymbol:(NSString *)symbol
                   orderId:(NSInteger)orderId
                     limit:(NSInteger)limit
                recvWindow:(NSInteger)recvWindow
                  callback:(BARestRequestCompleteBlock)callback;
- (void)accountWithRecvWindow:(NSInteger)recvWindow
                     callback:(BARestRequestCompleteBlock)callback;
- (void)myTradesWithSymbol:(NSString *)symbol
                    fromId:(NSInteger)fromId
                     limit:(NSInteger)limit
                recvWindow:(NSInteger)recvWindow
                  callback:(BARestRequestCompleteBlock)callback;
- (void)withdrawWithParam:(BAWithdrawParamModel *)paramModel
                 callback:(BARestRequestCompleteBlock)callback;
- (void)depositHistoryWithParam:(BAAssetHistoryQueryParamModel *)paramModel
                       callback:(BARestRequestCompleteBlock)callback;
- (void)withdrawHistoryWithParam:(BAAssetHistoryQueryParamModel *)paramModel
                        callback:(BARestRequestCompleteBlock)callback;

// User Stream
- (void)startUserStream:(BARestRequestCompleteBlock)callback;
- (void)keepUserStreamWithListenKey:(NSString *)listenKey callback:(BARestRequestCompleteBlock)callback;
- (void)closeUserStreamWithListenKey:(NSString *)listenKey callback:(BARestRequestCompleteBlock)callback;

@end
