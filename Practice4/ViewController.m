//
//  ViewController.m
//  Practice3
//
//  Created by Jun Aoki on 2017/05/08.
//  Copyright © 2017年 Jun Aoki. All rights reserved.
//

#import "ViewController.h"
//#import <TwitterKit/TwitterKit.h>
//#import"SearchController.h"
@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

//@property (weak, nonatomic) TWTRLogInButton *logInButton;



//@property (weak, nonatomic) IBOutlet UIToolbar *Tab;

//@property (weak, nonatomic) IBOutlet UIBarButtonItem *Back;

@property (nonatomic) VModel *test;


@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (weak, nonatomic) IBOutlet UISearchBar *Bar;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *btn;



@property(strong,nonatomic) NSString *ConsumerKey;
@property(strong,nonatomic) NSString *ConsumerSecret;


@property (strong, nonatomic) NSArray *tweets;
@property (strong, nonatomic) NSString *query;
//@property (weak, nonatomic) IBOutlet UINavigationBar *TabBar;

//- (void)loadTweetsWithQuery:(NSInteger)count;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // UITableViewの設定
    [self.tableView registerClass:[TWTRTweetTableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.tableView.hidden = NO;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.estimatedRowHeight=10;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    // TWTRLogInButtonの設定
    /*TWTRLogInButton *logInButton = [TWTRLogInButton buttonWithLogInCompletion:^(TWTRSession *session, NSError *error) {
        if (error) {
            NSLog(@"Error : %@", error);
        } else {
            NSLog(@"UserName : %@", session.userName);
            self.logInButton.hidden = YES;
            self.tableView.hidden = NO;
            //[self loadTweets:session.userID];
        }
    }];
    logInButton.center = self.view.center;
    self.logInButton = logInButton;
    [self.view addSubview:logInButton];*/
    
 /*   NSString *ConsumerKey=@"vl7xne8RLHCdfSwS6jawUhWO";
    NSString *ConsumerSecret=@"TH0qn9KOiBDBxBfRv6Rcp2C4vCW17pz9rpigKMw2cVJscHr8AT";*/

    
    
    _test = [VModel sharedInstance];
    

}




/*
 - (void)loadTweets:(NSString *)userId
 {
 // タイムラインを取得
 //TWTRSession *t_session = [Twitter sharedInstance].sessionStore.session;
 //NSString *userID = t_session.userID;
 TWTRAPIClient *client = [[TWTRAPIClient alloc] initWithUserID:userId];
 //TWTRAPIClient *client = [[TWTRAPIClient alloc] init];
 // NSString *endpoint = @"https://api.twitter.com/1.1/statuses/home_timeline.json";
 NSString *endpoint = @"https://api.twitter.com/1.1/search/tweets.json";
 NSDictionary *parameters = nil;
 NSString *tweetID;
 //    NSString *query=@"\"明日\"";
 NSString *query= [NSString stringWithFormat:@"/%@/", _Bar.text];
 NSLog(@"%@",userId);
 
 if (tweetID == nil){
 parameters = @{ @"q": query, @"count":@"10" };
 } else {
 parameters = @{ @"q": query, @"count":@"10", @"max_id":tweetID };
 }
 
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
 completion:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
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
 NSLog(@"%@", tweets);
 //                        strongSelf.tweets = [TWTRTweet tweetsWithJSONArray:jsonData];
 strongSelf.tweets = tweets;
 [strongSelf.tableView reloadData];
 }];
 }
 */

/*
 - (void)loadTweets:(NSString *)userId
 {
 // タイムラインを取得
 //TWTRSession *t_session = [Twitter sharedInstance].sessionStore.session;
 //NSString *userID = t_session.userID;
 TWTRAPIClient *client = [[TWTRAPIClient alloc] initWithUserID:userId];
 //TWTRAPIClient *client = [[TWTRAPIClient alloc] init];
 // NSString *endpoint = @"https://api.twitter.com/1.1/statuses/home_timeline.json";
 NSString *endpoint = @"https://api.twitter.com/1.1/search/tweets.json";
 NSDictionary *parameters = nil;
 NSString *tweetID;
 //    NSString *query=@"\"明日\"";
 NSString *query= [NSString stringWithFormat:@"/%@/", _Bar.text];
 NSLog(@"%@",userId);
 
 if (tweetID == nil){
 parameters = @{ @"q": query, @"count":@"10" };
 } else {
 parameters = @{ @"q": query, @"count":@"10", @"max_id":tweetID };
 }
 
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
 completion:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
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
 NSLog(@"%@", tweets);
 //                        strongSelf.tweets = [TWTRTweet tweetsWithJSONArray:jsonData];
 strongSelf.tweets = tweets;
 [strongSelf.tableView reloadData];
 }];
 }
 */

/*- (void)loadTweetsWithQuery:(NSInteger)count
{
    // タイムラインを取得
    TWTRAPIClient *client = [[TWTRAPIClient alloc] initWithUserID:nil];
    NSString *endpoint = @"https://api.twitter.com/1.1/search/tweets.json";
    NSDictionary *parameters = nil;
    //    NSString *tweetID;
    //    NSString *query=@"\"明日\"";
       NSString *query= [NSString stringWithFormat:@"/%@/", _Bar.text];
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
                    completion:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
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
                        NSLog(@"%@", tweets);
                        //                        strongSelf.tweets = [TWTRTweet tweetsWithJSONArray:jsonData];
                        strongSelf.tweets = tweets;
                        [strongSelf.tableView reloadData];
                    }];
}*/

- (IBAction)btn:(id)sender {

     NSString *query= [NSString stringWithFormat:@"/%@/", _Bar.text];
    NSLog(@"%@",query);
//    VModel *test = [[VModel alloc] init];
    
    __weak typeof (self) wSelf = self;
       [_test loadTweetsWithQuery:query count:15 complete:^(NSArray *tweets){
           __strong typeof (self) sSelf = wSelf;
           [sSelf.tableView reloadData];
       }];
    
    //self.tweets=test.tweets;

}



#pragma mark - UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
            NSLog(@"%ld",[_test.tweets count]);
                return [_test.tweets count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TWTRTweetTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    [cell configureWithTweet:_test.tweets[indexPath.row]];
    return cell;
}

/*- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
 return [TWTRTweetTableViewCell heightForTweet:self.tweets[indexPath.row] width:self.tableView.bounds.size.width];
 }*/


@end
