package flxRnn.state 
{
	import org.flixel.FlxRect;
	import org.flixel.FlxState;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxText;
	import flxRnn.Player;
	import flxRnn.Asset;
	import flxRnn.MonsterFactory;

	public class PlayState extends FlxState 
	{
		private var _background:FlxSprite;
		private var _player:Player;
		private var _monsters:MonsterFactory;
		
		private var _scoreHud:FlxSprite;
		private var _scoreText:FlxText;
		private var _liveHud:FlxSprite;
		private var _liveText:FlxText;
		
		public function PlayState() 
		{
			FlxG.mouse.show();
		}

		override public function create():void
		{
			_background = new FlxSprite(0, 0, Asset.BackgroundBoard1);
			add(_background);
			
			_player = new Player(100, 100);
			_player.worldDimension = new FlxRect(0, 0, _background.width, _background.height);
			add(_player);
			
			FlxG.camera.follow(_player);
			FlxG.camera.setBounds(0, 0, _background.width, _background.height);
			
			_monsters = new MonsterFactory();
			add(_monsters);
			
			_scoreHud = new FlxSprite(10, 15, Asset.HudScore);
			_scoreHud.angle = -10;
			_scoreHud.scrollFactor.x = _scoreHud.scrollFactor.y = 0;
			add(_scoreHud);
			
			_scoreText = new FlxText(15, 35, 150, "Score : " + FlxG.score);
			_scoreText.setFormat(null, 22, 0xff00ff, "center");
			_scoreText.angle = -15;
			_scoreText.scrollFactor.x = _scoreText.scrollFactor.y = 0;
			add(_scoreText);
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
			_scoreText.text = "Score : " + FlxG.score;
		}
		
		override public function draw():void
		{
			super.draw();
			_player.draw();
			_monsters.draw();
		}
	}

}