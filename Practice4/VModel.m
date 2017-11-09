//
//  VModel.m
//  Practice4
//
//  Created by Jun Aoki on 2017/05/12.
//  Copyright © 2017年 Jun Aoki. All rights reserved.
//
//#import <Foundation/Foundation.h>
#import "VModel.h"

@implementation VModel


//@property (strong, nonatomic) NSArray *tweets;



/*- (void)callsomeWorker{
    NSLog(@"call backed");
    _isLoading=@"success";
}*/

+ (instancetype)sharedInstance {
    static VModel *_vmodel = nil;
    
    @synchronized (self) {
        if(!_vmodel) {
            _vmodel = [VModel new];
        }
    }
    
    return _vmodel;
}


- (void)loadTweetsWithQuery:(NSString*) query count:(NSInteger)count complete:(void (^)(NSArray* tweet))complete {
    
    
        // タイムラインを取得
        TWTRAPIClient *client = [[TWTRAPIClient alloc] initWithUserID:nil];
        NSString *endpoint = @"https://api.twitter.com/1.1/search/tweets.json";
        NSDictionary *parameters = nil;
        //    NSString *tweetID;
        //    NSString *query=@"\"明日\"";
        //NSString *query= [NSString stringWithFormat:@"/%@/", _Bar.text];
        //    NSLog(@"%@",userId);
        //
        parameters = @{ @"q": query, @"count":[NSString stringWithFormat:@"%ld", count] };
        
        NSError *error = nil;
        
   
    
        NSURLRequest *request = [client URLRequestWithMethod:@"GET"
                                                         URL:endpoint
                                                  parameters:parameters
                                                       error:&error];
    
        if (error) {
            NSLog(@"Error: %@", error);
            return;
        }
    

        __weak typeof(self) weakSelf = self;
        [client sendTwitterRequest:request
                        completion:^(NSURLResponse *response, NSData *data, NSError *connectionError){
                            //                        __weak typeof(self) weakSelf = self;
                           __strong typeof(self) strongSelf = weakSelf;
                            
                            if (connectionError) {
                                NSLog(@"Error: %@", error);
                                return;
                            }
                            NSError *jsonError = nil;
                            id jsonData = [NSJSONSerialization JSONObjectWithData:data
                                                                          options:NSJSONReadingMutableContainers
                                                                            error:&jsonError];
                            
                            if (jsonError) {
                                NSLog(@"Error: %@", jsonError);
                                return;
                            }
                            NSArray *tweets = [TWTRTweet tweetsWithJSONArray:jsonData[@"statuses"]];
                        
                                                                            //strongSelf.tweets = [TWTRTweet tweetsWithJSONArray:jsonData];
                          
                              strongSelf.tweets = tweets;
                            if(strongSelf.tweets!=nil){
//                            if(tweets){
                                NSLog(@"%@",tweets);
                  

                                complete(tweets);

                            }
                            
                            //[strongSelf reloadData];
                        }];
    
    }




@end


