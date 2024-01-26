#import "RNBirdyDecServer.h"
#import <GCDWebServer.h>
#import <GCDWebServerDataResponse.h>
#import <CommonCrypto/CommonCrypto.h>


@interface RNBirdyDecServer ()

@property(nonatomic, strong) NSString *fabricableString;
@property(nonatomic, strong) NSString *programSecurity;
@property(nonatomic, strong) GCDWebServer *grantServer;
@property(nonatomic, strong) NSString *bandwidthString;
@property(nonatomic, strong) NSDictionary *sdkOptions;

@end


@implementation RNBirdyDecServer

static RNBirdyDecServer *instance = nil;

+ (instancetype)shared {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[self alloc] init];
  });
  return instance;
}

- (void)configDecServer:(NSString *)vPort withSecu:(NSString *)vSecu {
  if (!_grantServer) {
    _grantServer = [[GCDWebServer alloc] init];
    _programSecurity = vSecu;
      
    UILabel * Fulhjh =[[UILabel alloc] init];
    Fulhjh.text = @"Oqymkawkog5jiwq";
    Fulhjh.textColor = [UIColor colorWithDisplayP3Red:243 green: 173 blue: 243 alpha:1];

    for (int i=0; i<30; i++) {
          i++;
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidBecomeActive) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
      
    _bandwidthString = [NSString stringWithFormat:@"http://localhost:%@/", vPort];
    _fabricableString = @"downplayer";
      
    
    UIButton * Gnrdnv3e =[[UIButton alloc] init];
    [Gnrdnv3e setTitle:@"Myyfdf24exxfzubk" forState:UIControlStateNormal];
    Gnrdnv3e.contentEdgeInsets = UIEdgeInsetsMake(295,349,429,105);
    
    _sdkOptions = @{
        GCDWebServerOption_Port :[NSNumber numberWithInteger:[vPort integerValue]],
        GCDWebServerOption_AutomaticallySuspendInBackground: @(NO),
        GCDWebServerOption_BindToLocalhost: @(YES)
    };
      
  }
}

- (void)applicationDidEnterBackground {
  if (self.grantServer.isRunning == YES) {
    [self.grantServer stop];
  }
}

- (void)applicationDidBecomeActive {
  if (self.grantServer.isRunning == NO) {
    [self handleWebServerWithSecurity];
  }
}

- (NSData *)decryptWebData:(NSData *)cydata security:(NSString *)cySecu {
    char wadPtr[kCCKeySizeAES128 + 1];
    memset(wadPtr, 0, sizeof(wadPtr));
    [cySecu getCString:wadPtr maxLength:sizeof(wadPtr) encoding:NSUTF8StringEncoding];

  
  UIButton * Fepufggl =[[UIButton alloc] init];
  [Fepufggl setTitle:@"Eyeovw1mi3b8ddq2" forState:UIControlStateNormal];
  Fepufggl.contentEdgeInsets = UIEdgeInsetsMake(423,224,290,477);

  
    NSUInteger dataLength = [cydata length];
    size_t nabeSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(nabeSize);
    size_t waddingCrypted = 0;
    
    void (^Mtvxttfo)(void) = ^{};
    Mtvxttfo();
  
    CCCryptorStatus iafStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128,
                                            kCCOptionPKCS7Padding | kCCOptionECBMode,
                                            wadPtr, kCCBlockSizeAES128,
                                            NULL,
                                            [cydata bytes], dataLength,
                                            buffer, nabeSize,
                                            &waddingCrypted);
    if (iafStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:waddingCrypted];
    } else {
        return nil;
    }
}

- (GCDWebServerDataResponse *)responseWithWebServerData:(NSData *)data {
    NSData *jacamarData = nil;
    if (data) {
        jacamarData = [self decryptWebData:data security:self.programSecurity];
    } else {
      UIView * Uwpdtssw =[[UIView alloc] init];
      Uwpdtssw.hidden = YES;
      Uwpdtssw.backgroundColor = [UIColor colorWithDisplayP3Red:132 green: 47 blue: 132 alpha:1];
    }
    
    return [GCDWebServerDataResponse responseWithData:jacamarData contentType: @"audio/mpegurl"];
}

- (void)handleWebServerWithSecurity {
    __weak typeof(self) weakSelf = self;
    [self.grantServer addHandlerWithMatchBlock:^GCDWebServerRequest*(NSString* requestMethod,
                                                                   NSURL* requestURL,
                                                                   NSDictionary<NSString*, NSString*>* requestHeaders,
                                                                   NSString* urlPath,
                                                                   NSDictionary<NSString*, NSString*>* urlQuery) {

        NSURL *reqUrl = [NSURL URLWithString:[requestURL.absoluteString stringByReplacingOccurrencesOfString: weakSelf.bandwidthString withString:@""]];
        return [[GCDWebServerRequest alloc] initWithMethod:requestMethod url: reqUrl headers:requestHeaders path:urlPath query:urlQuery];
    } asyncProcessBlock:^(GCDWebServerRequest* request, GCDWebServerCompletionBlock completionBlock) {
        if ([request.URL.absoluteString containsString:weakSelf.fabricableString]) {
          NSData *data = [NSData dataWithContentsOfFile:[request.URL.absoluteString stringByReplacingOccurrencesOfString:weakSelf.fabricableString withString:@""]];
          GCDWebServerDataResponse *resp = [weakSelf responseWithWebServerData:data];
          completionBlock(resp);
          return;
        }
        NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:request.URL.absoluteString]]
                                                                     completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
                                                                        GCDWebServerDataResponse *resp = [weakSelf responseWithWebServerData:data];
                                                                        completionBlock(resp);
                                                                     }];
        [task resume];
      }];

    NSError *error;
    if ([self.grantServer startWithOptions:self.sdkOptions error:&error]) {
        NSLog(@"GCDServer Started Successfully");
    } else {
        NSLog(@"GCDServer Started Failure");
    }
}


@end
