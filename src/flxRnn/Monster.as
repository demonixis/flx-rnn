package flxRnn
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxRect;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	
	/**
	 * ...
	 * @author Yannick Comte
	 */
	public class Monster extends FlxSprite 
	{
		private var _cameraRect:FlxRect;
		private var _texture:Class;
		private var _type:int;
		private var _direction:FlxPoint;
		private var _speed:FlxPoint;
		
		public function Monster(type:int) 
		{	
			super( -10, -10);
			
			_cameraRect = FlxG.camera.bounds;
			
			FlxG.camera.bounds;
			if (type < 0) _type = 0;
			else if (type >= 3) _type = 2;
			else _type = type;
			
			// Les animations sont prêtes on connait la largeur et la hauteur d'un sprite
			prepareAnimations();
		
			this.x = Math.random() * _cameraRect.width;
			this.y = Math.random() * _cameraRect.height - this.height;
			
			_direction = new FlxPoint( 
				((Math.random() * 100) % 2) == 0 ? 1 : -1, 
				((Math.random() * 50) % 2) == 0 ? 1 : -1);
				
			_speed = new FlxPoint(Math.random() * Constant.MonsterSpeed, Math.random() * Constant.MonsterSpeed);
			
			var scale:Number = Math.random() * Constant.MonsterScaleMax;
			this.scale = new FlxPoint(scale, scale);
		}
		
		private function prepareAnimations():void
		{
			
			
			var anims:Array = new Array(4);
			var size:FlxPoint;
			
			switch(_type)
			{
				case 0: 
					_texture = Asset.SpriteLardon;
					anims = [0, 2, 3, 1]; 
					size = new FlxPoint(33, 32);  
					break;
				case 1: 
					_texture = Asset.SpriteMacaron;
					anims = [1, 0, 3, 2]; 
					size = new FlxPoint(64, 64);
					break;
				case 2: 
					_texture = Asset.SpritePainEpice;
					anims = [0, 2, 3, 1]; 
					size = new FlxPoint(64, 64);
					break;
			}
			
			loadGraphic(_texture, true, true, size.x, size.y);
			addAnimation("up", [anims[0]]);
			addAnimation("down", [anims[1]]);
			addAnimation("left", [anims[2]]);
			addAnimation("right", [anims[3]]);
			play("down");
		}
		
		override public function update():void
		{
			if (this.x < _cameraRect.x)
			{
				_direction.x = 1;
				play("right");
			}
			else if (this.x + this.width > _cameraRect.width)
			{
				_direction.x = -1;
				play("left");
			}
		
			
			if (this.y < _cameraRect.y)
			{
				_direction.y = 1;
				play("down");
			}
			else if (this.y + this.height > _cameraRect.height)
			{
				_direction.y = -1;
				play("up");
			}
			
			this.x += _direction.x * _speed.x;
			this.y += _direction.y * _speed.y;
		}
		
		override public function draw():void
		{
			super.draw();
		}
		
	}

}