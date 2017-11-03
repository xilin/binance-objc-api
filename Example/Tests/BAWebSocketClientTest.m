//
//  BAWebSocketClientTest.m
//  BinanceApiClient_Tests
//
//  Created by LinXi on 03/11/2017.
//  Copyright © 2017 linxi60@gmail.com. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <BinanceApiClient/BAClientFactory.h>

@interface BAWebSocketClientTest : XCTestCase

@property(nonatomic, strong) BAClientFactory *clientFactory;

@end

@implementation BAWebSocketClientTest

- (void)setUp {
    [super setUp];
    self.clientFactory = [[BAClientFactory alloc] initWithApiKey:@"YOUR API KEY" secret:@"YOUR AECRET"];
}

- (void)tearDown {
    [super tearDown];
    self.clientFactory = nil;
}

- (void)testDepth {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test Depth"];
    BAWebSocketClient *client = [self.clientFactory webSocketClient];
    __weak __typeof(client) weakClient = client;
    [client onDepthEventWithSymbol:@"ethbtc"
                            listen:^(BADepthEventModel *eventModel) {
                              XCTAssertNotNil(eventModel);
                              [weakClient close];
                              if (expectation) {
                                  [expectation fulfill];
                                  // multiple calls made to -[XCTestExpectation fulfill] is not allowed
                                  expectation = nil;
                              }
                            }];
    [self waitForExpectations:@[ expectation ] timeout:10.f];
}

- (void)testKLine {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test KLine"];
    BAWebSocketClient *client = [self.clientFactory webSocketClient];
    __weak __typeof(client) weakClient = client;
    [client onKLineEventWithSymbol:@"ethbtc"
                          interval:kKLineIntervalOneHour
                            listen:^(BAKLineEventModel *eventModel) {
                              XCTAssertNotNil(eventModel);
                              XCTAssertNotNil(eventModel.barDetail);
                              [weakClient close];
                              if (expectation) {
                                  [expectation fulfill];
                                  expectation = nil;
                              }
                            }];
    [self waitForExpectations:@[ expectation ] timeout:10.f];
}

- (void)testAggTrade {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test AggTrade"];
    BAWebSocketClient *client = [self.clientFactory webSocketClient];
    __weak __typeof(client) weakClient = client;
    [client onTradeEventWithSymbol:@"ethbtc"
                            listen:^(BAAggTradeEventModel *eventModel) {
                              XCTAssertNotNil(eventModel);
                              [weakClient close];
                              if (expectation) {
                                  [expectation fulfill];
                                  expectation = nil;
                              }
                            }];
    [self waitForExpectations:@[ expectation ] timeout:10.f];
}

// you have to make some change to your account in order to run this test
- (void)testUserData {
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"Test User Data"];
    BARestClient *restClient = [self.clientFactory restClient];
    [restClient startUserStream:^(BARestStartUserStreamApi *startRequest, BOOL isSucceed) {
      XCTAssertTrue(isSucceed);
      XCTAssertNotNil(startRequest.listenKey);
      BAWebSocketClient *webSocketClient = [self.clientFactory webSocketClient];
      __weak __typeof(webSocketClient) weakWebSocketClient = webSocketClient;
      [webSocketClient onUserDataEventWithListenKey:startRequest.listenKey
                                             listen:^(BAOrderTradeUpdateEventModel *eventModel) {
                                               XCTAssertNotNil(eventModel);
                                               XCTAssertNotNil(eventModel.eventType);
                                               [weakWebSocketClient close];
                                               if (expectation) {
                                                   [expectation fulfill];
                                                   expectation = nil;
                                               }
                                             }];
    }];

    [self waitForExpectations:@[ expectation ] timeout:20.f];
}

@end
