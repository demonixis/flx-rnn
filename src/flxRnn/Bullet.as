package flxRnn
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxPoint;
	import org.flixel.FlxG;
	
	public class Bullet extends FlxSprite
	{	
		public function Bullet(posX:int, posY:int, angle:Number) 
		{
			super(posX, posY, Asset.ObjectBullet);
			
			var math:MathHelper = MathHelper.instance;
			
			var a:Number = Constant.BulletSpeed  * Math.cos(math.toRadian(angle - 90));
			var vx:Number = a;
			var vy:Number = a * Math.tan(math.toRadian(angle - 90));
			
			this.angle = angle;
			
			this.velocity = new FlxPoint(vx, vy);
		}
		
		override public function update():void
		{
			super.update();
			if (this.x < 0 || this.x + this.width > FlxG.width || this.y < 0 || this.y + this.height > FlxG.height)
			{
				this.kill();
			}
		}
		
		override public function draw():void
		{
			super.draw();
		}
	}

}