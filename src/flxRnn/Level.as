package flxRnn 
{
	import flxRnn.state.PlayState;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Yannick Comte
	 */
	public class Level extends FlxSprite
	{
		private var _id:int;
		private var _endSprite:FlxSprite;
		private var _cherrySprite:FlxSprite;
		private var _isFinish:Boolean;
		
		private var e_player:Player;
		
		public function Level(id:int, player:Player) 
		{
			this._id = id;
			this.e_player = player;
			this._isFinish = false;
			
			var mathHelper:MathHelper = MathHelper.instance;
			
			_endSprite = new FlxSprite(
				mathHelper.getRandomInt(0, FlxG.camera.width), 
				mathHelper.getRandomInt(0, FlxG.camera.height), 
				Asset.ObjectCherryPanel);
				
			// régérnation aléatoire
			mathHelper.getRandomInt(45, 78);
			
			_cherrySprite = new FlxSprite(
				mathHelper.getRandomInt(0, FlxG.camera.width), 
				mathHelper.getRandomInt(0, FlxG.camera.height),  
				Asset.ObjectCherry);
			_cherrySprite.scale = new FlxPoint(3, 3);
		}
		
		override public function update():void
		{
			FlxG.collide(e_player, _cherrySprite, onPlayerCherryCollide);
			FlxG.collide(_cherrySprite, _endSprite, onCherryEndCollide);
			
			if (e_player.disableShoot && (FlxG.keys.justReleased("SPACE") || !FlxG.mouse.pressed()))
			{
				e_player.disableShoot = false;
				e_player.speed = Constant.PlayerSpeed;
			}
		}
		
		override public function draw():void
		{
			_endSprite.draw();
			
			_cherrySprite.draw();
		}
		
		private function onPlayerCherryCollide(player:FlxObject, cherry:FlxObject):void
		{			
			if (FlxG.keys.SPACE || FlxG.mouse.pressed())
			{
				_cherrySprite.x = e_player.x;
				_cherrySprite.y = e_player.y;
				e_player.disableShoot = true;
				e_player.speed = Constant.PlayerSpeedCherry;
			}
		}
		
		private function onCherryEndCollide(player:FlxObject, cherry:FlxObject):void
		{
			_isFinish = true;
		}
		
		public function get isFinish():Boolean
		{
			return _isFinish;
		}
	}

}