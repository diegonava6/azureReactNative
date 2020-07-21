//
//  AwesomeProjectUITests.m
//  AwesomeProjectUITests
//
//  Created by Diego Nava on 19/07/20.
//

#import <XCTest/XCTest.h>

@interface AwesomeProjectUITests : XCTestCase

@end

@implementation AwesomeProjectUITests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
  
    [XCTContext runActivityNamed:@"screenshots"
                           block:^(id<XCTActivity>  _Nonnull activity) {
    
    // UI tests must launch the application that they test.
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];
  
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
  
  [app.textFields[@"6"] tap];
  
  XCUIElement *aKey = app/*@START_MENU_TOKEN@*/.keys[@"a"]/*[[".keyboards.keys[@\"a\"]",".keys[@\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/;
  [aKey tap];
  
  XCUIElement *bKey = app/*@START_MENU_TOKEN@*/.keys[@"b"]/*[[".keyboards.keys[@\"b\"]",".keys[@\"b\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/;
  [bKey tap];
  
  XCUIElement *TestText = [[XCUIApplication alloc]
                       init].textFields[@"6ab"];
  
  XCTAssertEqual(TestText.exists, true);
    }];
}

- (void)testLaunchPerformance {
    if (@available(macOS 10.15, iOS 13.1, tvOS 13.0, *)) {
        // This measures how long it takes to launch your application.
        [self measureWithMetrics:@[XCTOSSignpostMetric.applicationLaunchMetric] block:^{
            [[[XCUIApplication alloc] init] launch];
        }];
    }
}

@end
