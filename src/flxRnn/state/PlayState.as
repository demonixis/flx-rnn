package flxRnn.state 
{
	import org.flixel.FlxState;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import flxRnn.Player;
	import flxRnn.Asset;
	import flxRnn.MonsterFactory;

	public class PlayState extends FlxState 
	{
		private var _background:FlxSprite;
		private var _player:Player;
		private var _monsters:MonsterFactory;
		
		public function PlayState() 
		{
			FlxG.mouse.show();
		}

		override public function create():void
		{
			_background = new FlxSprite(0, 0, Asset.BackgroundBoard1);
			add(_background);
			
			_player = new Player(100, 100);
			add(_player);
			
			_monsters = new MonsterFactory();
			add(_monsters);
		}
		
		
		override public function update():void
		{
			super.update();
			_player.update();
			_monsters.update();
			
			FlxG.collide(_player.bullets, _monsters, onCollideBulletMonster);
			FlxG.collide(_player, _monsters, onCollidePlayerMonster);
		}
		
		public function onCollidePlayerMonster(entity1:FlxObject, entity2:FlxObject):void
		{
			// Alpha
			
			// Diminuer vitesse
			
			// Enclencher timer
		}
		
		public function onCollideBulletMonster(entity1:FlxObject, entity2:FlxObject):void
		{
			entity1.kill();
			entity2.kill();
			FlxG.score++;
		}
		
		override public function draw():void
		{
			super.draw();
			_player.draw();
			_monsters.draw();
		}
	}

}