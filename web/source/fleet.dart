part of TOTC;

class Fleet extends Sprite {
  static const TEAM1SARDINE = 1;
  static const TEAM2SARDINE = 2;
  
  ResourceManager _resourceManager;
  Juggler _juggler;
  Game _game;
  Ecosystem _ecosystem;
  
  TouchManager tmanager = new TouchManager();
  TouchLayer tlayer = new TouchLayer();
  
  List<Boat> boats = new List<Boat>();
  
  Fleet(ResourceManager resourceManager, Juggler juggler, Game game) {
    _resourceManager = resourceManager;
    _juggler = juggler;
    _game = game;
    
    tmanager.registerEvents(_game);
    tmanager.addTouchLayer(tlayer);
    
    addBoat(TEAM1SARDINE, _game.width~/2-150, _game.height~/2, math.PI/2);
    addBoat(TEAM2SARDINE, _game.width~/2+150, _game.height~/2, -math.PI/2);
  }
  
  void addBoat(int type, int x, int y, num rot) {
    Boat boat = new Boat(_resourceManager, _juggler, type, _game, this);
    boat.x = x;
    boat.y = y;
    boat.rotation = rot;
    boats.add(boat);
    tlayer.touchables.add(boat);
    addChild(boat);
    _juggler.add(boat);
  }
}