//
//  BASignedTest.m
//  BinanceApiClient_Tests
//
//  Created by LinXi on 02/11/2017.
//  Copyright © 2017 linxi60@gmail.com. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <YYCategories/NSString+YYAdd.h>

@interface BASignedTest : XCTestCase

@end

@implementation BASignedTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    NSString *data = @"symbol=LTCBTC&side=BUY&type=LIMIT&timeInForce=GTC&quantity=1&price=0.1&recvWindow=5000&timestamp=1499827319559";
    NSString *key = @"NhqPtmdSJYdKjVHjA7PZj4Mge3R5YNiP1e3UZjInClVN65XAbvqqM6A7H5fATj0j";
    NSString *signature = [data hmacSHA256StringWithKey:key];
    XCTAssertTrue([signature isEqualToString:@"c8db56825ae71d6d79447849e617115f4a920fa2acdcab2b053c4b2838bd6b71"]);
}

@end
