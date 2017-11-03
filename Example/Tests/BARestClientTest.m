//
//  BARestClientTest.m
//  BinanceApiClient_Tests
//
//  Created by LinXi on 02/11/2017.
//  Copyright © 2017 linxi60@gmail.com. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <BinanceApiClient/BAClientFactory.h>

@interface BARestClientTest : XCTestCase

@property(nonatomic, strong) BARestClient *restClient;

@end

@implementation BARestClientTest

- (void)setUp {
    [super setUp];
    _restClient = [[[BAClientFactory alloc] initWithApiKey:@"YOUR API KEY" secret:@"YOUR AECRET"] restClient];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    _restClient = nil;
}

- (void)testPing {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Test Ping"];
    [self.restClient ping:^(BARestPingApi *request, BOOL isSucceed) {
        XCTAssertTrue(isSucceed);
        XCTAssertTrue(request.isSucceed);
        [expectation fulfill];
    }];
    [self waitForExpectations:@[expectation] timeout:10.f];
}

- (void)testServerTime {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Test Server Time"];
    [self.restClient serverTime:^(BARestServerTimeApi *request, BOOL isSucceed) {
        XCTAssertTrue(isSucceed);
        XCTAssertTrue(request.serverTime > 1000);
        [expectation fulfill];
    }];
    [self waitForExpectations:@[expectation] timeout:10.f];
}

- (void)testOrderBook {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Test Order Book"];
    [self.restClient orderBookWithSymbol:@"ETHBTC" limit:10 callback:^(BARestOrderBookApi *request, BOOL isSucceed) {
        XCTAssertTrue(isSucceed);
        XCTAssertTrue(request.orderBookModel.lastUpdateId > 0);
        XCTAssertNotNil(request.orderBookModel.bids[0].price);
        [expectation fulfill];
    }];
    [self waitForExpectations:@[expectation] timeout:10.f];
}

- (void)testAggTrade {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Test Agg Trade"];
    [self.restClient aggTradeWithSymbol:@"ETHBTC" fromId:0 startTime:0 endTime:0 limit:10 callback:^(BARestAggTradesApi *request, BOOL isSucceed) {
        XCTAssertTrue(isSucceed);
        XCTAssertNotNil(request.aggTradeArray);
        [expectation fulfill];
    }];
    [self waitForExpectations:@[expectation] timeout:10.f];
}

- (void)testKLines {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Test kLines"];
    [self.restClient kLinesWithSymbol:@"ETHBTC" interval:kKLineIntervalOneMinute startTime:0 endTime:0 limit:10 callback:^(BARestKLinesApi *request, BOOL isSucceed) {
        XCTAssertTrue(isSucceed);
        XCTAssertNotNil(request.kLineArray);
        [expectation fulfill];
    }];
    [self waitForExpectations:@[expectation] timeout:10.f];
}

- (void)testTicker24H {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Test Ticker24H"];
    [self.restClient ticker24HourWithSymbol:@"ETHBTC" callback:^(BARestTicker24HourApi *request, BOOL isSucceed) {
        XCTAssertTrue(isSucceed);
        XCTAssertNotNil(request.statisticsModel);
        [expectation fulfill];
    }];
    [self waitForExpectations:@[expectation] timeout:10.f];
}

- (void)testTickerAllPrices {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Test Ticker All Prices"];
    [self.restClient tickerAllPricesWithCallback:^(BARestTickerAllPricesApi *request, BOOL isSucceed) {
        XCTAssertTrue(isSucceed);
        XCTAssertNotNil(request.tickerPriceArray);
        [expectation fulfill];
    }];
    [self waitForExpectations:@[expectation] timeout:10.f];
}

- (void)testTickerAllBookTickers {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Test Ticker All BookTickers"];
    [self.restClient tickerAllBookTickersWithCallback:^(BARestTickerAllBookTickersApi *request, BOOL isSucceed) {
        XCTAssertTrue(isSucceed);
        XCTAssertNotNil(request.bookTickerArray);
        [expectation fulfill];
    }];
    [self waitForExpectations:@[expectation] timeout:10.f];
}

- (void)testCreateOrder {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Test Create Order"];
    BACreateOrderModel *createOrderModel = [BACreateOrderModel new];
    createOrderModel.symbol = @"LINKETH";
    createOrderModel.side = kOrderSideBuy;
    createOrderModel.type = kOrderTypeLimit;
    createOrderModel.timeInForce = kTimeInForceGTC;
    createOrderModel.quantity = @"1";
    createOrderModel.price = @"0.01";
    [self.restClient createOrderWithParam:createOrderModel callback:^(BARestCreateOrderApi *request, BOOL isSucceed) {
        XCTAssertTrue(isSucceed);
        XCTAssertNotNil(request.createOrderResultModel);
        [expectation fulfill];
    }];
    [self waitForExpectations:@[expectation] timeout:100.f];
}

- (void)testTestCreateOrder {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Test Test Create Order"];
    BACreateOrderModel *createOrderModel = [BACreateOrderModel new];
    createOrderModel.symbol = @"LINKETH";
    createOrderModel.side = kOrderSideBuy;
    createOrderModel.type = kOrderTypeLimit;
    createOrderModel.timeInForce = kTimeInForceGTC;
    createOrderModel.quantity = @"1";
    createOrderModel.price = @"0.01";
    [self.restClient testCreateOrderWithParam:createOrderModel callback:^(BARestTestCreateOrderApi *request, BOOL isSucceed) {
        XCTAssertTrue(isSucceed);
        XCTAssertTrue([request isTestSucceed]);
        [expectation fulfill];
    }];
    [self waitForExpectations:@[expectation] timeout:100.f];
}

- (void)testQueryOrder {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Test Query Order"];
    BAQueryOrderParamModel *paramModel = [BAQueryOrderParamModel new];
    paramModel.symbol = @"LINKETH";
    paramModel.orderId = 1; // use real orderId in order to get test result
    [self.restClient queryOrderWithParam:paramModel callback:^(BARestQueryOrderApi *request, BOOL isSucceed) {
        XCTAssertFalse(isSucceed);
        XCTAssertNil(request.orderModel);
        [expectation fulfill];
    }];
    [self waitForExpectations:@[expectation] timeout:100.f];
}

- (void)testDeleteOrder {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Test Delete Order"];
    BAQueryOrderParamModel *paramModel = [BAQueryOrderParamModel new];
    paramModel.symbol = @"LINKETH";
    paramModel.orderId = 1; // use real orderId in order to get test result
    [self.restClient deleteOrderWithParam:paramModel callback:^(BARestDeleteOrderApi *request, BOOL isSucceed) {
        XCTAssertFalse(isSucceed);
        XCTAssertNil(request.resultModel);
        [expectation fulfill];
    }];
    [self waitForExpectations:@[expectation] timeout:100.f];
}

- (void)testOpenOrders {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Test Open Orders"];
    [self.restClient openOrdersWithSymbol:@"LTCBTC" recvWindow:0 callback:^(BARestOpenOrdersApi *request, BOOL isSucceed) {
        XCTAssertTrue(isSucceed);
        XCTAssertNotNil(request.orderArray);
        [expectation fulfill];
    }];
    [self waitForExpectations:@[expectation] timeout:100.f];
}

- (void)testAllOrders {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Test All Orders"];
    [self.restClient allOrderWithSymbol:@"LTCBTC" orderId:0 limit:0 recvWindow:0 callback:^(BARestAllOrdersApi *request, BOOL isSucceed) {
        XCTAssertTrue(isSucceed);
        XCTAssertNotNil(request.orderArray);
        [expectation fulfill];
    }];
    [self waitForExpectations:@[expectation] timeout:100.f];
}

- (void)testAccount {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Test Account"];
    [self.restClient accountWithRecvWindow:0 callback:^(BARestAccountInfoApi *request, BOOL isSucceed) {
        XCTAssertTrue(isSucceed);
        XCTAssertNotNil(request.accountInfoModel);
        [expectation fulfill];
    }];
    [self waitForExpectations:@[expectation] timeout:100.f];
}

- (void)testTrades {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Test Trades"];
    [self.restClient myTradesWithSymbol:@"LTCBTC" fromId:0 limit:0 recvWindow:0 callback:^(BARestMyTradesApi *request, BOOL isSucceed) {
        XCTAssertTrue(isSucceed);
        XCTAssertNotNil(request.tradeArray);
        [expectation fulfill];
    }];
    [self waitForExpectations:@[expectation] timeout:100.f];
}

- (void)testWithdraw {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Test Withdraw"];
    BAWithdrawParamModel *model = [BAWithdrawParamModel new];
    model.asset = @"BTC";
    model.address = @"18RvD78jweTpHzJ6v33CNcUzhQy6drhG9q";
    model.amount = @"0.01";
    [self.restClient withdrawWithParam:model callback:^(BARestWithdrawApi *request, BOOL isSucceed) {
        XCTAssertTrue(isSucceed);
        XCTAssertNotNil(request.resultModel);
        XCTAssertFalse(request.resultModel.success);
        [expectation fulfill];
    }];
    [self waitForExpectations:@[expectation] timeout:100.f];
}

- (void)testDepositHistory {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Test Deposit History"];
    BAAssetHistoryQueryParamModel *model = [BAAssetHistoryQueryParamModel new];
    [self.restClient depositHistoryWithParam:model callback:^(BADepositHistoryApi *request, BOOL isSucceed) {
        XCTAssertTrue(isSucceed);
        XCTAssertNotNil(request.depositArrayModel);
        [expectation fulfill];
    }];
    [self waitForExpectations:@[expectation] timeout:100.f];
}

- (void)testWithdrawHistory {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Test Withdraw History"];
    BAAssetHistoryQueryParamModel *model = [BAAssetHistoryQueryParamModel new];
    [self.restClient withdrawHistoryWithParam:model callback:^(BAWithdrawHistoryApi *request, BOOL isSucceed) {
        XCTAssertTrue(isSucceed);
        XCTAssertNotNil(request.withdrawArrayModel);
        [expectation fulfill];
    }];
    [self waitForExpectations:@[expectation] timeout:100.f];
}

- (void)testUserStream {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Test User Stream"];
    __weak __typeof(self)weakSelf = self;
    [self.restClient startUserStream:^(BARestStartUserStreamApi *startRequest, BOOL isSucceed) {
        XCTAssertTrue(isSucceed);
        XCTAssertNotNil(startRequest.listenKey);
        [weakSelf.restClient keepUserStreamWithListenKey:startRequest.listenKey callback:^(BARestKeepAliveUserStreamApi *keepRequest, BOOL isSucceed) {
            XCTAssertTrue(isSucceed);
            [weakSelf.restClient closeUserStreamWithListenKey:startRequest.listenKey callback:^(__kindof BARestRequest *request, BOOL isSucceed) {
                XCTAssertTrue(isSucceed);
                [expectation fulfill];
            }];
        }];
    }];

    [self waitForExpectations:@[expectation] timeout:20.f];
}

@end
