//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"

@implementation MainScene
{
    CCSprite * ball;
    CCTextField * vel;
    CCTextField * acce;
    CCTextField * angleAdjust;
    CCLabelTTF * angleDisplay;
    float  angle;
     float velocity;
    float  acceleration;
    CCPhysicsNode * physicsBody;
    CGPoint ballloc;
    BOOL ayy;
}
-(void)didLoadFromCCB
{
    ayy=false;
    NSLog(@"called");
    physicsBody.debugDraw=false;
//    angle = angleAdjust.string.intValue;
//    NSLog(@"%i", angle);
    
    ball.physicsBody.type=CCPhysicsBodyTypeStatic;

}

-(void)update:(CCTime)delta
{
    if(ayy==true)
    {
        NSLog(@"sus shit going on");
        CCSprite *track = (CCSprite*)[CCBReader load:@"Tracker"];
        track.positionInPoints=ballloc;
    }
}
-(void)launch{
    
    ballloc = ball.positionInPoints;
    //setting all attributes
    angle= angleAdjust.string.floatValue;
    NSLog(@"angle is %f", angle);
    velocity= vel.string.floatValue;
    NSLog(@"velocity is %f", velocity);
    acceleration= acce.string.floatValue;
    NSLog(@"angle is %f", acce);
//    CGPoint make = ccp(100.f, 100.f);
    //calculating velocity of impluse
    float  xvel = velocity * cosf(angle*M_PI/180);
    float  yvel = velocity * sinf(angle*M_PI/180);
    
    //launching object
    ball.physicsBody.type=CCPhysicsBodyTypeDynamic;

    [ball.physicsBody applyImpulse:ccp(40*xvel, 40*yvel)];
    ayy=true;

    NSLog(@"button pressed");
    
}
//reseting ball's position
-(void)reset
{
    NSLog(@"called");
    ball.positionInPoints= ballloc;
    if(ball.physicsBody.type!=CCPhysicsBodyTypeStatic)
    {
        
  ball.physicsBody.type=CCPhysicsBodyTypeStatic;
    }
    else{
//        ball.physicsBody.type=CCPhysicsBodyTypeStatic;
    }
    ayy=false;
}
@end
