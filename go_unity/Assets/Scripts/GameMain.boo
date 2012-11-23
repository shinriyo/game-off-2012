import UnityEngine

class GameMain (MonoBehaviour):

    public _hudObj as GameObject
    private _arrestKeeper as ArrestKeeper
    private _guiText as GUITexture
    private _point as int

    def Awake ():
        _arrestKeeper = ArrestKeeper()
        _guiText = _hudObj.transform.Find("PointText").GetComponent[of GUITexture]()
        playerPref as GameObject = (Resources.Load('megaman') as GameObject)
        enemy1Pref as GameObject = (Resources.Load('megaman') as GameObject)
#        _enemy = (Resources.Load('link') as GameObject)
#        _enemy = (Resources.Load('mario') as GameObject)
        playerObj as GameObject = Instantiate(playerPref);
        playerObj.AddComponent[of Megaman]()

        transform.parent =  playerObj.transform

        enemy1Obj as GameObject = Instantiate(enemy1Pref)
        enemy1Obj.transform.localPosition = Vector3(-10, 0, 100)
        enemy1Obj.transform.eulerAngles = Vector3(0, 180, 0)

        enemy2Obj as GameObject =.Instantiate(enemy1Pref) # TODO: later 2
        enemy2Obj.transform.localPosition = Vector3(10, 0, 100)
        enemy2Obj.transform.eulerAngles = Vector3(0, 180, 0)

        enemy3Obj as GameObject =.Instantiate(enemy1Pref); # TODO: later 3
        enemy3Obj.transform.localPosition = Vector3(20, 0, 100)
        enemy3Obj.transform.eulerAngles = Vector3(0, 180, 0)

        enemy4Obj as GameObject =.Instantiate(enemy1Pref); # TODO: later 4
        enemy4Obj.transform.localPosition = Vector3(30, 0, 100)
        enemy4Obj.transform.eulerAngles = Vector3(0, 180, 0)

    def Start ():
        pass

    def Update ():
        pass
