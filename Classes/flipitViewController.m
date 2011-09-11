//
//  flipitViewController.m
//  flipit
//
//  Created by Shabda Raaj on 11/09/11.
//  Copyright 2011 Agiliq. All rights reserved.
//

#import "flipitViewController.h"

@interface NSString (Extended)
-(NSString *)reverseString;
-(NSMutableString *)flipString;
@end

@implementation NSString (Extended)
-(NSString *) reverseString
{
    NSUInteger len = [self length];
    NSMutableString *rtr=[NSMutableString stringWithCapacity:len];
    //        unichar buf[1];
    
    while (len > (NSUInteger)0) { 
        unichar uch = [self characterAtIndex:--len]; 
        [rtr appendString:[NSString stringWithCharacters:&uch length:1]];
    }
    return rtr;
}
-(NSString *) flipString
{
    static const NSInteger N_ENTRIES = 46;
    NSDictionary *replaceDict;
    //NSString *keyArray[N_ENTRIES];
    //NSNumber *valueArray[N_ENTRIES];
    
    /*
     a : '\u0250', 
     b : 'q', 
     c : '\u0254', 
     d : 'p', 
     e : '\u01DD', 
     f : '\u025F', 
     g : '\u0183', 
     h : '\u0265', 
     i : '\u0131', 
     j : '\u027E', 
     k : '\u029E', 
     l : 'l', 
     m : '\u026F', 
     n : 'u', 
     o : 'o', 
     p : 'd', 
     q : 'b', 
     r : '\u0279', 
     s : 's', 
     t : '\u0287', 
     u : 'n', 
     v : '\u028C', 
     w : '\u028D', 
     y : '\u028E', 
     z : 'z', 
     }
     */
    
    
    NSString *keyArray[] = {@"a", @"b", @"c",
        @"d", @"e", @"f", @"g", @"h", @"i", @"j", @"k", @"l", @"m",
        @"n", @"o", @"p", @"q", @"r", @"s", @"t", @"u", @"v", @"w", 
        @"x", @"y", @"z",
        @"1",
        @"2",
        @"3",
        @"4",
        @"5",
        @"6",
        @"7",
        @"8",
        @"9",
        @"0",
        @".", 
        @",",
        @"\@",
        @"\"", 
        @"´",
        @"`",
        @";",
        @"!",
        @"\u00A1@",
        @"?",
        @"\u00BF@",
        @"[",
        @"]",
        @"(",
        @")",
        @"{",
        @"}",
        @"<",
        @">",
        @"_",
        @"\r"
    };
    NSString *valueArray[] = {
        @"\u0250", 
        @"q", 
        @"\u0254",
        @"p",
        @"\u01DD",
        @"\u025F",
        @"\u0183",
        @"\u0265",
        @"\u0131",
        @"\u027E",
        @"\u029E",
        @"l", 
        @"\u026F",
        @"u", 
        @"o", 
        @"d", 
        @"b", 
        @"\u0279",
        @"s", 
        @"\u0287",
        @"n", 
        @"\u028C",
        @"\u028D",
        @"x",
        @"\u028E",
        @"z",
        @"\u21C2",
        @"\u1105", 
        @"\u1110", 
        @"\u3123", 
        @"\u03DB",
        @"9", 
        @"\u3125", 
        @"8", 
        @"6", 
        @"0",
        @"\u02D9",
        @"\'", 
        @",", 
        @",,", 
        @",", 
        @",", 
        @"\u061B", 
        @"\u00A1", 
        @"!", 
        @"\u00BF", 
        @"?", 
        @"]", 
        @"[", 
        @")", 
        @"(", 
        @"}", 
        @"{", 
        @">", 
        @"<", 
        @"\u203E", 
        @"\n"
        
    };
    
    
    replaceDict = [NSDictionary dictionaryWithObjects:(id *)valueArray
                                              forKeys:(id *)keyArray count:N_ENTRIES];
    NSMutableString *fliptxt = [self mutableCopy];
    for (NSString *target in replaceDict) {
        [fliptxt replaceOccurrencesOfString:target withString:[replaceDict objectForKey:target] 
                                    options:0 range:NSMakeRange(0, [fliptxt length])];
    }
    return fliptxt;
}

@end

@implementation flipitViewController

- (void) flipIt: (id) sender {
    
    NSString *origText = orig.text;
    NSMutableString *fliptxt = [origText flipString];
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    NSString *flippedTxt = [fliptxt reverseString];
    flipped.text = flippedTxt;
    [orig resignFirstResponder];
    [flipped resignFirstResponder];  
    pasteboard.string = flippedTxt;
    
}


- (void) hideKbd: (id) sender{
    [orig resignFirstResponder];
    [flipped resignFirstResponder];
}

- (IBAction) sendMail: (id) sender{

}






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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *origText = orig.text;
    NSMutableString *fliptxt = [origText flipString];
    
    flipped.text = [fliptxt reverseString];
    
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
