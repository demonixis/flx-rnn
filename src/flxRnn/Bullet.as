package flxRnn
{
	import org.flixel.FlxBasic;
	import org.flixel.FlxObject;
	import org.flixel.FlxRect;
	import org.flixel.FlxSprite;
	import org.flixel.FlxPoint;
	import org.flixel.FlxG;
	import org.flixel.FlxU;
	import org.flixel.FlxGroup;
	
	public class Bullet extends FlxSprite
	{	
		private var _cameraRect:FlxRect;
		
		public function Bullet(posX:int, posY:int, angle:Number) 
		{
			super(posX, posY, Asset.ObjectBullet);
			
			_cameraRect = FlxG.camera.bounds;
			
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
			if (this.x < _cameraRect.x || 
				this.x + this.width > _cameraRect.width || 
				this.y < _cameraRect.y || 
				this.y + this.height > _cameraRect.height)
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