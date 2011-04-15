//
//  SecondViewController.h
//  iNET
//
//  Created by Pablo Merino on 18/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SystemConfiguration/SystemConfiguration.h>

@interface SecondViewController : UIViewController {
	IBOutlet UILabel *status;
	IBOutlet UITextField *userhost;
	IBOutlet UIScrollView *scroller;
	IBOutlet UIButton *check;
}
-(IBAction)checkping:(id)sender;
- (IBAction)lock;
@end
