import UnityEngine

class GameMain (MonoBehaviour):

    public _hudObj as GameObject
    private _arrestKeeper as ArrestKeeper
    private _guiText as GUITexture
    private _point as int

    def Awake ():
        _arrestKeeper = ArrestKeeper()
        _guiText = _hudObj.transform.Find("PointText").GetComponent[of GUITexture]()
        playerPref as GameObject = (Resources.Load('Characters/megaman') as GameObject)

        megamanPref as GameObject = (Resources.Load('Characters/megaman') as GameObject)
        marioPref as GameObject = (Resources.Load('Characters/mario') as GameObject)
        # later add
#        linkPref as GameObject = (Resources.Load('Characters/link') as GameObject)
        enemyResourceArray as (GameObject) = array(GameObject, (megamanPref,marioPref ))
        componentStringArry as (string) = array(string, ("EnemyMegaman", "EnemyMario", "EnemyLink"))

        playerObj as GameObject = Instantiate(playerPref);
        playerObj.AddComponent[of Megaman]()

        transform.parent =  playerObj.transform
        index as int = Random.Range(0, 2) # larer componentStringArry.length
        enemy1Obj as GameObject = Instantiate(enemyResourceArray[index])
        enemy1Obj.AddComponent(componentStringArry[index])
        enemy1Obj.transform.localPosition = Vector3(-10, 0, 100)
        enemy1Obj.transform.eulerAngles = Vector3(0, 180, 0)

        index = Random.Range(0, 2)
        enemy2Obj as GameObject = Instantiate(enemyResourceArray[index])
        enemy2Obj.AddComponent(componentStringArry[index])
        enemy2Obj.transform.localPosition = Vector3(10, 0, 100)
        enemy2Obj.transform.eulerAngles = Vector3(0, 180, 0)

        index = Random.Range(0, 2)
        enemy3Obj as GameObject = Instantiate(enemyResourceArray[index])
        enemy3Obj.AddComponent(componentStringArry[index])
        enemy3Obj.transform.localPosition = Vector3(20, 0, 100)
        enemy3Obj.transform.eulerAngles = Vector3(0, 180, 0)

        index = Random.Range(0, 2)
        enemy4Obj as GameObject = Instantiate(enemyResourceArray[index])
        enemy4Obj.AddComponent(componentStringArry[index])
        enemy4Obj.transform.localPosition = Vector3(30, 0, 100)
        enemy4Obj.transform.eulerAngles = Vector3(0, 180, 0)

    def Start ():
        pass

    def Update ():
        pass
