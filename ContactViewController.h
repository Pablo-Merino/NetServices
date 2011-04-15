//
//  ContactViewController.h
//  iNET
//
//  Created by Pablo Merino on 19/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>


@interface ContactViewController : UIViewController <MFMailComposeViewControllerDelegate> {
IBOutlet UIScrollView *scroller;
}
-(IBAction)sendmemail:(id)sender;
-(IBAction)sendemail:(id)sender;
@end
