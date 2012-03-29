package  
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	
	/**
	 * ...
	 * @author Yannick Comte
	 */
	public class Player extends FlxSprite 
	{
		public function Player(positionX:int, positionY:int) 
		{
			super(positionX, positionY);
			loadGraphic(Asset.SpritePlayer, true, true, 33, 64);
			addAnimation("up", [0, 1, 2, 3], 15, false);
			addAnimation("down", [8, 9, 10, 10], 16, false);
			addAnimation("left", [12, 13, 14, 15], 15, false);
			addAnimation("right", [4, 5, 6, 7], 15, false);
			play("down");
		}

		
		override public function update():void
		{
			super.update();
			
			if (FlxG.keys.UP)
			{
				this.y--;
				this.play("up");
			}
			else if (FlxG.keys.DOWN)
			{
				this.y++;
				this.play("down");
			}
			
			if (FlxG.keys.LEFT)
			{
				this.x--;
				this.play("left");
			}
			else if (FlxG.keys.RIGHT)
			{
				this.x++;
				this.play("right");
			}
		}
		
	}

}