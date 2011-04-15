//
//  FirstViewController.m
//  iNET
//
//  Created by Pablo Merino on 18/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"
#include <ifaddrs.h>
#include <arpa/inet.h>

@implementation FirstViewController


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

- (NSString *)externalip {
	NSString *mrAPI = [NSString stringWithFormat:@"http://ifconfig.me/ip"];
	NSString *trimURL = [NSString stringWithContentsOfURL:[NSURL URLWithString:mrAPI]
												 encoding:NSASCIIStringEncoding
													error:nil];
}
- (NSString *)externalhost {
	NSString *mrAPI2 = [NSString stringWithFormat:@"http://ifconfig.me/host"];
	NSString *trimURL2 = [NSString stringWithContentsOfURL:[NSURL URLWithString:mrAPI2]
												  encoding:NSASCIIStringEncoding
													 error:nil];
}
- (NSString *)allinfo {
	NSString *mrAPI3 = [NSString stringWithFormat:@"http://ifconfig.me/all"];
	NSString *trimURL3 = [NSString stringWithContentsOfURL:[NSURL URLWithString:mrAPI3]
												  encoding:NSASCIIStringEncoding
													 error:nil];
}
-(IBAction)refresh {
    [self externalip];
    [self externalhost];
    [self allinfo];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	IP.text = [self externalip];
	IPHOST.text = [self externalhost];
	INFO.text = [self allinfo];
    IPLOCAL.text = [self getIPAddress];
	[scroller setScrollEnabled:YES];
	[scroller setContentSize:CGSizeMake(320, 574)];

    [super viewDidLoad];
}
- (NSString *)getIPAddress {
	NSString *address = @"No local IP or on 3G";
	struct ifaddrs *interfaces = NULL;
	struct ifaddrs *temp_addr = NULL;
	int success = 0;
	
	// retrieve the current interfaces - returns 0 on success
	success = getifaddrs(&interfaces);
	if (success == 0)
	{
		// Loop through linked list of interfaces
		temp_addr = interfaces;
		while(temp_addr != NULL)
		{
			if(temp_addr->ifa_addr->sa_family == AF_INET)
			{
				// Check if interface is en0 which is the wifi connection on the iPhone
				if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"])
				{
					// Get NSString from C String
					address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
				}
			}
			
			temp_addr = temp_addr->ifa_next;
		}
	}
	
	// Free memory
	freeifaddrs(interfaces);
	
	return address;
}
-(IBAction)copyexternal {
UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
[pasteboard setValue:[self externalip] forPasteboardType:@"public.utf8-plain-text"];
UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"External IP copied!" message:@"Your external IP has been copied!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil] autorelease];
[alert show];
}
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
