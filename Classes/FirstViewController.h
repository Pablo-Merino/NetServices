//
//  FirstViewController.h
//  iNET
//
//  Created by Pablo Merino on 18/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>



@interface FirstViewController : UIViewController {
	IBOutlet UILabel *IP;
	IBOutlet UILabel *IPHOST;
	IBOutlet UILabel *IPLOCAL;
	IBOutlet UITextView *INFO;
	IBOutlet UIScrollView *scroller;

}
-(IBAction)copyexternal;
-(IBAction)refresh;
@end
