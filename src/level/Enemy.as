package level 
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Matt Continisio
	 */
	public class Enemy extends FlxSprite
	{
		[Embed(source = "../../assets/images/enemy.png")] public var ImgEnemy:Class;
		
		public var timer:Number;
		
		public function Enemy( X:Number, Y:Number ) 
		{
			super( X, Y );
			
			acceleration.y = 800;
			maxVelocity.x = 300;
			maxVelocity.y = 800;
			drag.x = maxVelocity.x * 4;
			
			acceleration.x = 100;
			
			//makeGraphic( 24, 24, 0xFF8040 )
			loadGraphic( ImgEnemy, false, false, 24, 24 );
			
			timer = Math.random() * 2;
		}
		
		public override function update():void
		{
			super.update();
			
			timer += FlxG.elapsed;
			
			if ( timer > 2 )
			{
				timer = 0;
				acceleration.x *= -1;
			}
			
			if ( Math.abs( velocity.x ) >= maxVelocity.x )
			{
				acceleration.x *= -1;
			}
		}
	}

}