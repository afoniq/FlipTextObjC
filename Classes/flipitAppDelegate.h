//
//  flipitAppDelegate.h
//  flipit
//
//  Created by Shabda Raaj on 11/09/11.
//  Copyright 2011 Agiliq. All rights reserved.
//

#import <UIKit/UIKit.h>

@class flipitViewController;

@interface flipitAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    flipitViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet flipitViewController *viewController;

@end

