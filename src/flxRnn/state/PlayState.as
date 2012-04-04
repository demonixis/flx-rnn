package flxRnn.state 
{
	import flxRnn.HudTimer;
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
		private var _id:int;
		private var _background:FlxSprite;
		private var _player:Player;
		private var _monsters:MonsterFactory;
		
		private var _scoreHud:FlxSprite;
		private var _scoreText:FlxText;
		private var _levelHud:FlxSprite;
		private var _levelText:FlxText;
		private var _counterHud:HudTimer;
		
		public function PlayState(id:int) 
		{
			this._id = id;
			FlxG.mouse.show();
			FlxG.score = 0;
		}

		override public function create():void
		{
			_background = new FlxSprite(0, 0, Asset.BackgroundBoard1);
			add(_background);
			
			// 1 - Initialiser le viewport global
			FlxG.camera.setBounds(0, 0, _background.width, _background.height, true);
			
			_player = new Player(100, 100);
			add(_player);
			
			// 2 - Suivre le joueur
			FlxG.camera.follow(_player);
			
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
			
			_levelHud = new FlxSprite(600, 15, Asset.HudLive);
			_levelHud.angle = 10;
			_levelHud.scrollFactor.x = _levelHud.scrollFactor.y = 0;
			add(_levelHud);
			
			_levelText = new FlxText(620, 30, 150, "Gateau " + _id);
			_levelText.setFormat(null, 22, 0xff00ff, "center");
			_levelText.angle = 15;
			_levelText.scrollFactor.x = _levelText.scrollFactor.y = 0;
			add(_levelText);
			
			_counterHud = new HudTimer(15, 450);
			_counterHud.scrollFactor.x = _counterHud.scrollFactor.y = 0;
			add(_counterHud);
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