//
//  SecondViewController.m
//  iNET
//
//  Created by Pablo Merino on 18/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"


@implementation SecondViewController
-(IBOutlet)checkping:(id)sender {
	if( [[userhost text] isEqualToString:@""])
	{
		status.text = @"You have to write a host!";
	} else {
		NSString *host = userhost.text;
		bool success = false;
		const char *host_name = [host
								 cStringUsingEncoding:NSASCIIStringEncoding];
		
		SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithName(NULL,
																					host_name);
		SCNetworkReachabilityFlags flags;
		success = SCNetworkReachabilityGetFlags(reachability, &flags);
		bool isAvailable = success && (flags & kSCNetworkFlagsReachable) && 
		!(flags & kSCNetworkFlagsConnectionRequired);
		if (isAvailable) {
			status.text = @"The host is up! :)";
		}else{
			status.text = @"The host is down! :(";
		}
		
	}

	
		[userhost resignFirstResponder];

}
- (IBAction)lock {
		[userhost resignFirstResponder];
	}


// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[scroller setScrollEnabled:YES];
	[scroller setContentSize:CGSizeMake(320, 370)];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
