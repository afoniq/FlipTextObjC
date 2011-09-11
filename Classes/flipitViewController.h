//
//  flipitViewController.h
//  flipit
//
//  Created by Shabda Raaj on 11/09/11.
//  Copyright 2011 Agiliq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface flipitViewController : UIViewController {
    IBOutlet UITextView* orig;
    IBOutlet UITextView* flipped;
    
    

}

- (IBAction) flipIt: (id) sender;
- (IBAction) hideKbd: (id) sender;


@end

