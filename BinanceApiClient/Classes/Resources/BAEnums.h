//
//  BAEnums.h
//  BinanceApiClient
//
//  Created by LinXi on 02/11/2017.
//

#ifndef BAEnums_h
#define BAEnums_h

typedef NS_ENUM(NSUInteger, kKLineInterval) {
    kKLineIntervalOneMinute,
    kKLineIntervalThreeMinutes,
    kKLineIntervalFiveMinutes,
    kKLineIntervalFifteenMinutes,
    kKLineIntervalHalfHour,
    kKLineIntervalOneHour,
    kKLineIntervalTwoHours,
    kKLineIntervalFourHours,
    kKLineIntervalSixHours,
    kKLineIntervalEightHours,
    kKLineIntervalTwelveHours,
    kKLineIntervalOneDay,
    kKLineIntervalThreeDays,
    kKLineIntervalOneWeek,
    kKLineIntervalOneMonth,
};

typedef NS_ENUM(NSUInteger, kOrderSide) {
    kOrderSideBuy,
    kOrderSideSell,
};

typedef NS_ENUM(NSUInteger, kOrderType) {
    kOrderTypeLimit,
    kOrderTypeMarket,
};

typedef NS_ENUM(NSUInteger, kTimeInForce) {
    kTimeInForceGTC,
    kTimeInForceIOC,
};

typedef NS_ENUM(NSUInteger, kOrderStatus) {
    kOrderStatusNew,
    kOrderStatusPartiallyFilled,
    kOrderStatusFilled,
    kOrderStatusCanceled,
    kOrderStatusPendingCancel,
    kOrderStatusRejected,
    kOrderStatusExpired,
};

#endif /* BAEnums_h */
