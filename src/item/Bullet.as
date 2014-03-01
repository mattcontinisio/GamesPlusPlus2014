package item 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Matt Continisio
	 */
	public class Bullet extends FlxSprite
	{
		public function Bullet( X:Number, Y:Number ) 
		{
			super( X, Y );
			makeGraphic( 8, 8, 0xffffffff );
			width = 8;
			height = 8;
			
			flicker( -1 );
		}
		
		public override function update():void
		{
			super.update();
		}
	}

}