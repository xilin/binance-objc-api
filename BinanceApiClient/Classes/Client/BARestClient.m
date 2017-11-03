//
//  BARestClient.m
//  BinanceApiClient
//
//  Created by LinXi on 01/11/2017.
//

#import "BARestClient.h"
#import "YTKNetworkAgent.h"
#import "YTKNetworkConfig.h"
#import "BAConstants.h"

@interface BARestClient ()

@property(nonatomic, copy) NSString *apiKey;
@property(nonatomic, copy) NSString *secret;

@end

@implementation BARestClient

#pragma mark - init
- (instancetype)initWithApiKey:(NSString *)apiKey secret:(NSString *)secret {
    if (self = [super init]) {
        _apiKey = apiKey;
        _secret = secret;

        [self configNetwork];
        [self setupLog];
    }
    return self;
}

- (void)configNetwork {
    YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];
    config.baseUrl = BA_API_BASE_URL;
#ifdef DEBUG
    config.debugLogEnabled = YES;
#endif
    //    [config addUrlFilter:[MTUrlFilter new]];
    NSSet *contentTypeSet = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/json", @"text/html", @"image/png", nil];
    [[YTKNetworkAgent sharedAgent] setValue:contentTypeSet forKeyPath:@"_manager.responseSerializer.acceptableContentTypes"];
}

- (void)setupLog {
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor cyanColor] backgroundColor:nil forFlag:DDLogFlagInfo];
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor grayColor] backgroundColor:nil forFlag:DDLogFlagDebug];
}

#pragma mark - private methods
- (void)startRequest:(BARestRequest *)request withCompleteBlock:(BARestRequestCompleteBlock)block {
    [self interceptRequest:request];

    [request startWithCompletionBlockWithSuccess:^(__kindof BARestRequest *_Nonnull request) {
      if (block) {
          block(request, YES);
      }
    }
        failure:^(__kindof YTKBaseRequest *_Nonnull request) {
          DDLogError(@"Request fail: %@", request.requestUrl);
          DDLogError(@"HTTP Error Info: %@", request.error.localizedDescription);
          DDLogError(@"Server Error Info: %@", request.responseString);
          BOOL result = NO;
          if (request.responseStatusCode == 504) {
              // HTTP 504 return code is used when the API successfully sent the message but not get a response within the timeout period.
              // It is important to NOT treat this as a failure; the execution status is UNKNOWN and could have been a success.
              result = YES;
          }
          // TODO: show error message
          if (block) {
              block(request, result);
          }
        }];
}

- (void)interceptRequest:(BARestRequest *)request {
    if ([request isKindOfClass:[BAApiKeyRestRequest class]]) {
        [(BAApiKeyRestRequest *)request setApiKey:self.apiKey];
    }
    if ([request isKindOfClass:[BASignedRestRequest class]]) {
        [(BASignedRestRequest *)request setApiSecret:self.secret];
    }
}

#pragma mark - BARestClientProtocol
#pragma mark - general
- (void)ping:(BARestRequestCompleteBlock)callback {
    BARestPingApi *pingApi = [[BARestPingApi alloc] init];
    [self startRequest:pingApi withCompleteBlock:callback];
}

- (void)serverTime:(BARestRequestCompleteBlock)callback {
    BARestServerTimeApi *serverTimeApi = [[BARestServerTimeApi alloc] init];
    [self startRequest:serverTimeApi withCompleteBlock:callback];
}

#pragma mark - market
- (void)orderBookWithSymbol:(NSString *)symbol limit:(NSInteger)limit callback:(BARestRequestCompleteBlock)callback {
    BARestOrderBookApi *orderBookApi = [[BARestOrderBookApi alloc] initWithSymbol:symbol limit:limit];
    [self startRequest:orderBookApi withCompleteBlock:callback];
}

- (void)aggTradeWithSymbol:(NSString *)symbol
                    fromId:(NSInteger)fromId
                 startTime:(NSInteger)startTime
                   endTime:(NSInteger)endTime
                     limit:(NSInteger)limit
                  callback:(BARestRequestCompleteBlock)callback {
    BARestAggTradesApi *aggApi = [[BARestAggTradesApi alloc] initWithSymbol:symbol
                                                                     fromId:fromId
                                                                  startTime:startTime
                                                                    endTime:endTime
                                                                      limit:limit];
    [self startRequest:aggApi withCompleteBlock:callback];
}

- (instancetype)kLinesWithSymbol:(NSString *)symbol
                        interval:(kKLineInterval)interval
                       startTime:(NSInteger)startTime
                         endTime:(NSInteger)endTime
                           limit:(NSInteger)limit
                        callback:(BARestRequestCompleteBlock)callback {
    BARestKLinesApi *kLinesApi = [[BARestKLinesApi alloc] initWithSymbol:symbol kKLineInterval:interval startTime:startTime endTime:endTime limit:limit];
    [self startRequest:kLinesApi withCompleteBlock:callback];
}

- (void)ticker24HourWithSymbol:(NSString *)symbol callback:(BARestRequestCompleteBlock)callback {
    BARestTicker24HourApi *tickerApi = [[BARestTicker24HourApi alloc] initWithSymbol:symbol];
    [self startRequest:tickerApi withCompleteBlock:callback];
}

- (void)tickerAllPricesWithCallback:(BARestRequestCompleteBlock)callback {
    BARestTickerAllPricesApi *allPricesApi = [[BARestTickerAllPricesApi alloc] init];
    [self startRequest:allPricesApi withCompleteBlock:callback];
}

- (void)tickerAllBookTickersWithCallback:(BARestRequestCompleteBlock)callback {
    BARestTickerAllBookTickersApi *allBookTickersApi = [[BARestTickerAllBookTickersApi alloc] init];
    [self startRequest:allBookTickersApi withCompleteBlock:callback];
}

#pragma mark - account
- (void)createOrderWithParam:(BACreateOrderModel *)createOrderModel
                    callback:(BARestRequestCompleteBlock)callback {
    BARestCreateOrderApi *createApi = [[BARestCreateOrderApi alloc] initWithCreateOrderParam:createOrderModel];
    [self startRequest:createApi withCompleteBlock:callback];
}

- (void)testCreateOrderWithParam:(BACreateOrderModel *)createOrderModel
                        callback:(BARestRequestCompleteBlock)callback {
    BARestTestCreateOrderApi *createApi = [[BARestTestCreateOrderApi alloc] initWithCreateOrderParam:createOrderModel];
    [self startRequest:createApi withCompleteBlock:callback];
}

- (void)queryOrderWithParam:(BAQueryOrderParamModel *)paramModel
                   callback:(BARestRequestCompleteBlock)callback {
    BARestQueryOrderApi *queryApi = [[BARestQueryOrderApi alloc] initWithParam:paramModel];
    [self startRequest:queryApi withCompleteBlock:callback];
}

- (void)deleteOrderWithParam:(BAQueryOrderParamModel *)paramModel
                    callback:(BARestRequestCompleteBlock)callback {
    BARestDeleteOrderApi *deleteApi = [[BARestDeleteOrderApi alloc] initWithParam:paramModel];
    [self startRequest:deleteApi withCompleteBlock:callback];
}

- (void)openOrdersWithSymbol:(NSString *)symbol
                  recvWindow:(NSInteger)recvWindow
                    callback:(BARestRequestCompleteBlock)callback {
    BARestOpenOrdersApi *ordersApi = [[BARestOpenOrdersApi alloc] initWithSymbol:symbol recvWindow:recvWindow];
    [self startRequest:ordersApi withCompleteBlock:callback];
}

- (void)allOrderWithSymbol:(NSString *)symbol
                   orderId:(NSInteger)orderId
                     limit:(NSInteger)limit
                recvWindow:(NSInteger)recvWindow
                  callback:(BARestRequestCompleteBlock)callback {
    BARestAllOrdersApi *allOrdersApi = [[BARestAllOrdersApi alloc] initWithSymbol:symbol
                                                                          orderId:orderId
                                                                            limit:limit
                                                                       recvWindow:recvWindow];
    [self startRequest:allOrdersApi withCompleteBlock:callback];
}

- (void)accountWithRecvWindow:(NSInteger)recvWindow
                     callback:(BARestRequestCompleteBlock)callback {
    BARestAccountInfoApi *infoApi = [[BARestAccountInfoApi alloc] initWithRecvWindow:recvWindow];
    [self startRequest:infoApi withCompleteBlock:callback];
}

- (void)myTradesWithSymbol:(NSString *)symbol
                    fromId:(NSInteger)fromId
                     limit:(NSInteger)limit
                recvWindow:(NSInteger)recvWindow
                  callback:(BARestRequestCompleteBlock)callback {
    BARestMyTradesApi *tradesApi = [[BARestMyTradesApi alloc] initWithSymbol:symbol
                                                                      fromId:fromId
                                                                       limit:limit
                                                                  recvWindow:recvWindow];
    [self startRequest:tradesApi withCompleteBlock:callback];
}

- (void)withdrawWithParam:(BAWithdrawParamModel *)paramModel
                 callback:(BARestRequestCompleteBlock)callback {
    BARestWithdrawApi *withdrawApi = [[BARestWithdrawApi alloc] initWithParam:paramModel];
    [self startRequest:withdrawApi withCompleteBlock:callback];
}

- (void)depositHistoryWithParam:(BAAssetHistoryQueryParamModel *)paramModel
                       callback:(BARestRequestCompleteBlock)callback {
    BADepositHistoryApi *depositHistoryApi = [[BADepositHistoryApi alloc] initWithParam:paramModel];
    [self startRequest:depositHistoryApi withCompleteBlock:callback];
}

- (void)withdrawHistoryWithParam:(BAAssetHistoryQueryParamModel *)paramModel
                        callback:(BARestRequestCompleteBlock)callback {
    BAWithdrawHistoryApi *withdrawHistoryApi = [[BAWithdrawHistoryApi alloc] initWithParam:paramModel];
    [self startRequest:withdrawHistoryApi withCompleteBlock:callback];
}

#pragma mark - user stream
- (void)startUserStream:(BARestRequestCompleteBlock)callback {
    BARestStartUserStreamApi *startApi = [[BARestStartUserStreamApi alloc] init];
    [self startRequest:startApi withCompleteBlock:callback];
}

- (void)keepUserStreamWithListenKey:(NSString *)listenKey callback:(BARestRequestCompleteBlock)callback {
    BARestKeepAliveUserStreamApi *keepApi = [[BARestKeepAliveUserStreamApi alloc] initWithListenKey:listenKey];
    [self startRequest:keepApi withCompleteBlock:callback];
}

- (void)closeUserStreamWithListenKey:(NSString *)listenKey callback:(BARestRequestCompleteBlock)callback {
    BARestCloseUserStreamApi *closeApi = [[BARestCloseUserStreamApi alloc] initWithListenKey:listenKey];
    [self startRequest:closeApi withCompleteBlock:callback];
}

@end
