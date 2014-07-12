//
//  MyScene.m
//  FollowPathSpriteKitTutorial
//
//  Created by Jesus Magana on 7/12/14.
//  Copyright (c) 2014 ZeroLinux5. All rights reserved.
//

#import "MyScene.h"

@interface MyScene ()

@property (nonatomic) SKSpriteNode *giraffe;

@end

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor whiteColor];
        
        self.giraffe = [SKSpriteNode spriteNodeWithImageNamed:@"giraffe"];
        self.giraffe.position = CGPointMake(100, self.frame.size.height/2);
        [self addChild:self.giraffe];
        
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, 0, 0);
        CGPathAddLineToPoint(path, NULL, 50, 100);
        SKAction *followline = [SKAction followPath:path asOffset:YES orientToPath:NO duration:3.0];
        
        SKAction *reversedLine = [followline reversedAction];
        
        UIBezierPath *square = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 100, 100)];
        SKAction *followSquare = [SKAction followPath:square.CGPath asOffset:YES orientToPath:NO duration:5.0];
        
        UIBezierPath *circle = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 100, 100) cornerRadius:100];
        SKAction *followCircle = [SKAction followPath:circle.CGPath asOffset:YES orientToPath:NO duration:5.0];
        
        [self.giraffe runAction:[SKAction sequence:@[followline, reversedLine, followSquare, followCircle]]];
    }
    return self;
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
