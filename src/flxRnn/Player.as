package flxRnn
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import org.flixel.FlxRect;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.FlxText;
	
	/**
	 * ...
	 * @author Yannick Comte
	 */
	public class Player extends FlxSprite 
	{
		private var _cameraRect:FlxRect;
		private var _listBullets:FlxGroup;
		private var _canShoot:Boolean;
		private var _disabledShoot:Boolean;
		private var _bulletShootInterval:Number;
		private var _angle:Number;
		private var _mathHelper:MathHelper;
		private var _speed:int;
		
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
			_speed = Constant.PlayerSpeed;
			_disabledShoot = false;
			
			this.immovable = true;
			
			this._cameraRect = FlxG.camera.bounds;
		}

		override public function update():void
		{
			super.update();
			
			var nextPostition:FlxPoint = new FlxPoint(this.x, this.y);
			var lastPosition:FlxPoint = new FlxPoint(this.x, this.y);
			
			_bulletShootInterval -= FlxG.elapsed;
			if (_bulletShootInterval <= 0)
			{
				_canShoot = true;
				_bulletShootInterval = 0.25;
			}
			
			if (FlxG.keys.UP || FlxG.keys.Z)
			{
				nextPostition.y -= _speed;
				this.play("up");
			}
			else if (FlxG.keys.DOWN || FlxG.keys.S)
			{
				nextPostition.y += _speed;
				this.play("down");
			}
			
			if (FlxG.keys.LEFT || FlxG.keys.Q)
			{
				nextPostition.x -= _speed;
				this.play("left");
			}
			else if (FlxG.keys.RIGHT || FlxG.keys.D)
			{
				nextPostition.x += _speed;
				this.play("right");
			}
			
			if (!_disabledShoot && (FlxG.keys.SPACE || FlxG.mouse.pressed()))
			{
				shoot();
			}
			
			_angle = _mathHelper.getAngle(this.x, this.y, FlxG.mouse.getWorldPosition(FlxG.camera).x, FlxG.mouse.getWorldPosition(FlxG.camera).y);
			
			if (nextPostition.x < _cameraRect.x || 
				nextPostition.x + this.width > _cameraRect.width || 
				nextPostition.y < _cameraRect.y || 
				nextPostition.y + this.height > _cameraRect.height)
			{
				updatePosition(lastPosition);
			}
			else
			{
				updatePosition(nextPostition);
			}
			
			_listBullets.update();
		}
		
		private function updatePosition(position:FlxPoint):void
		{
			this.x = position.x;
			this.y = position.y;
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
		
		public function set speed(speed:int):void
		{
			_speed = speed;
		}
		
		public function set disableShoot(shoot:Boolean):void
		{
			_disabledShoot = shoot;
		}
		
		public function get disableShoot():Boolean
		{
			return _disabledShoot;
		}
	}

}