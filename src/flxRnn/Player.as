package flxRnn
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	
	/**
	 * ...
	 * @author Yannick Comte
	 */
	public class Player extends FlxSprite 
	{
		private var _listBullets:FlxGroup;
		private var _canShoot:Boolean;
		private var _bulletShootInterval:Number;
		private var _angle:Number;
		private var _mathHelper:MathHelper;
		
		public function Player(positionX:int, positionY:int) 
		{
			super(positionX, positionY);
			loadGraphic(Asset.SpritePlayer, true, true, 33, 64);
			addAnimation("up", [0, 1, 2, 3], 15, false);
			addAnimation("down", [8, 9, 10, 10], 16, false);
			addAnimation("left", [12, 13, 14, 15], 15, false);
			addAnimation("right", [4, 5, 6, 7], 15, false);
			play("down");
			
			_listBullets = new FlxGroup();
			_mathHelper = MathHelper.instance;
			
			_canShoot = true;
			_bulletShootInterval = 0;
		}

		override public function update():void
		{
			super.update();
			
			_bulletShootInterval -= FlxG.elapsed;
			if (_bulletShootInterval <= 0)
			{
				_canShoot = true;
				_bulletShootInterval = 0.25;
			}
			
			if (FlxG.keys.UP || FlxG.keys.Z)
			{
				this.y--;
				this.play("up");
			}
			else if (FlxG.keys.DOWN || FlxG.keys.S)
			{
				this.y++;
				this.play("down");
			}
			
			if (FlxG.keys.LEFT || FlxG.keys.Q)
			{
				this.x--;
				this.play("left");
			}
			else if (FlxG.keys.RIGHT || FlxG.keys.D)
			{
				this.x++;
				this.play("right");
			}
			
			if (FlxG.keys.SPACE || FlxG.mouse.pressed())
			{
				shoot();
			}
			
			_angle = _mathHelper.getAngle(this.x, this.y, FlxG.mouse.screenX, FlxG.mouse.screenY);
			
			_listBullets.update();
		}
		
		
		
		override public function draw():void
		{
			super.draw();
			_listBullets.draw();
		}
		
		public function get bullets():FlxGroup
		{
			return _listBullets;
		}
		
		public function shoot ():void 
		{
			if (_canShoot)
			{
				_canShoot = false;
				
				_listBullets.add(new Bullet(this.x, this.y, _angle));
			}
		}
	}

}