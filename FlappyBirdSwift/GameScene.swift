//
//  GameScene.swift
//  FlappyBirdSwift
//
//  Created by Sergio Escoto on 3/14/16.
//  Copyright (c) 2016 BNR. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var bird = SKSpriteNode()
    var pipeUpTexture = SKTexture()
    var pipeDownTexture = SKTexture()
    var PipesMoveAndRemove = SKAction()
    
    override func didMoveToView(view: SKView) {
        
        //Physics
        self.physicsWorld.gravity = CGVectorMake(0.0, -5.0);
        
        //Bird
        var BirdTexture = SKTexture(imageNamed: "flappy_bird");
        BirdTexture.filteringMode = SKTextureFilteringMode.Nearest
        
        bird = SKSpriteNode(texture: BirdTexture)
        bird.setScale(0.5)
        bird.position = CGPoint(x: self.frame.size.width * 0.35, y: self.frame.size.height * 0.6)
        
        bird.physicsBody = SKPhysicsBody(circleOfRadius: bird.size.height / 2.0)
        bird.physicsBody!.dynamic = true
        bird.physicsBody?.allowsRotation = false
        
        self.addChild(bird)
        
        //Ground
        var groundTexture = SKTexture(imageNamed: "ground")
        
        var sprite = SKSpriteNode(texture: groundTexture)
        sprite.setScale(2.0)
        sprite.position = CGPointMake(self.size.width / 2, sprite.size.height/2.0)
        
        self.addChild(sprite)
        
        var ground = SKNode()
        
        ground.position = CGPointMake(0, groundTexture.size().height)
        ground.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.frame.size.width, groundTexture.size().height * 2.0))
        
        ground.physicsBody!.dynamic = false
        
        self.addChild(ground)
        
        // Pipes
        // Create the Pipes
        
        pipeUpTexture = SKTexture(imageNamed: "pipe_up")
        pipeDownTexture = SKTexture(imageNamed: "pipe_down")
        
        // Movement of pipes
        
        let distanceToMove = CGFloat(self.frame.size.width + 2.0 * pipeUpTexture.size().width)
        let movePipes = SKAction.moveByX(-distanceToMove, y: 0.0, duration: NSTimeInterval(0.01 * distanceToMove))
        let removePipes = SKAction.removeFromParent()
        
        PipesMoveAndRemove = SKAction.sequence([movePipes.removePipes])
        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            bird.physicsBody!.velocity = CGVectorMake(0, 0)
            bird.physicsBody?.applyImpulse(CGVectorMake(0, 25))
            
            
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
