//
//  VModel.h
//  Practice4
//
//  Created by Jun Aoki on 2017/05/12.
//  Copyright © 2017年 Jun Aoki. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <TwitterKit/TwitterKit.h>
@interface VModel : NSObject

//- (void)Logintwitter;
@property (strong, nonatomic) NSArray *tweets;

+ (instancetype)sharedInstance;

- (void)loadTweetsWithQuery:(NSString*) query count:(NSInteger)count complete:(void (^)(NSArray* tweet))complete;
    

@end
