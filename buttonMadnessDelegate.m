//
//  buttonMadnessDelegate.m
//  buttonMadness
//
//  Created by Yidi Hou on 21/10/10.
//  Copyright 2010 SFU. All rights reserved.
//

#import "buttonMadnessDelegate.h"


@implementation buttonMadnessDelegate
- (void)awakeFromNib
{
	array=[[NSMutableArray alloc] init];
	for(int i=0;i<10;i++){
		[array addObject:[NSMutableDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[NSNumber numberWithBool:i==0],[NSString stringWithFormat:@"title %d",i],nil]
															forKeys:[NSArray arrayWithObjects:@"check",@"title",nil]]];
	}
}


-(void)dealloc
{
	[array release];
	array=nil;
	[super dealloc];
}

#pragma mark NSTableView Delegate

- (void)tableViewSelectionDidChange:(NSNotification *)aNotification
{
	NSInteger i=[[aNotification object] selectedRow];
	if (i<0 || i>=[array count]) {
		return;
	}
}

#pragma mark NSTableViewDataSource Delegate


- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView
{
	if(array==nil)return 0;
	
	return [array count];
}

- (id)tableView: (NSTableView *)theTableView objectValueForTableColumn: (NSTableColumn *)theColumn row:(NSInteger)rowIndex
{
	return [[array objectAtIndex:rowIndex] objectForKey:[theColumn identifier]];
}

- (void)tableView:(NSTableView *)aTableView willDisplayCell:(id)aCell forTableColumn:(NSTableColumn *)theColumn row:(NSInteger)rowIndex
{
}

- (void)tableView:(NSTableView *)aTableView setObjectValue:(id)anObject forTableColumn:(NSTableColumn *)theColumn row:(NSInteger)rowIndex
{
	if([[theColumn identifier] isEqualToString:@"check"]){
		int i=0;
		for(NSMutableDictionary *d in array){
			[d setObject:[NSNumber numberWithBool:rowIndex==i] forKey:@"check"];
			i++;
		}
		[aTableView reloadData];
	}
}

#pragma mark NSApplication Delegate Methods

- (BOOL)application:(NSApplication *)theApplication openFile:(NSString *)filename 
{
	return NO;
}

- (void)applicationWillFinishLaunching:(NSNotification *)aNotification {
}

- (void) applicationDidFinishLaunching:(NSNotification *)aNotification {
}

//Same as applicationDidFinishLaunching, called when we are asked to reopen (that is, we are already running)
- (BOOL) applicationShouldHandleReopen:(NSApplication *)theApplication hasVisibleWindows:(BOOL)flag {
	return NO;
}

- (BOOL) applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication {
	return NO;
}

- (void) applicationWillTerminate:(NSNotification *)notification {
}


@end
