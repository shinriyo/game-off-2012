import UnityEngine

class GameMain (MonoBehaviour):

    public _hudObj as GameObject
    private _arrestKeeper as ArrestKeeper
    private _pointText as GUIText
    private _messageText as GUIText
    private _typeText as GUIText
    private _point as int

    def Awake ():
        _arrestKeeper = ArrestKeeper()
        _pointText = _hudObj.transform.Find("PointText").GetComponent[of GUIText]()
        _messageText = _hudObj.transform.Find("MessageText").GetComponent[of GUIText]()
        _typeText = _hudObj.transform.Find("TypeText").GetComponent[of GUIText]()
        _messageText.text = "Game Over"
        megamanPref as GameObject = (Resources.Load('Characters/megaman') as GameObject)
        marioPref as GameObject = (Resources.Load('Characters/mario') as GameObject)
        # [later add] linkPref as GameObject = (Resources.Load('Characters/link') as GameObject)
        characterResourceArray  as (GameObject) = array(GameObject, (megamanPref, marioPref))
        playerComponentStringArry as (string) = array(string, ("Megaman", "Mario", "Link"))
        enemyComponentStringArry as (string) = array(string, ("EnemyMegaman", "EnemyMario", "EnemyLink"))

        # player
        selectedIndex as int = Random.Range(0, 2)
        playerObj as GameObject = Instantiate(characterResourceArray[selectedIndex]);
        playerObj.AddComponent(playerComponentStringArry[selectedIndex])

        # enemies
        transform.parent =  playerObj.transform
        index as int = Random.Range(0, 2) # larer enemyComponentStringArry.length
        enemy1Obj as GameObject = Instantiate(characterResourceArray [index])
        enemy1Obj.AddComponent(enemyComponentStringArry[index])
        enemy1Obj.transform.localPosition = Vector3(-10, 0, 100)
        enemy1Obj.transform.eulerAngles = Vector3(0, 180, 0)

        index = Random.Range(0, 2)
        enemy2Obj as GameObject = Instantiate(characterResourceArray [index])
        enemy2Obj.AddComponent(enemyComponentStringArry[index])
        enemy2Obj.transform.localPosition = Vector3(10, 0, 100)
        enemy2Obj.transform.eulerAngles = Vector3(0, 180, 0)

        index = Random.Range(0, 2)
        enemy3Obj as GameObject = Instantiate(characterResourceArray [index])
        enemy3Obj.AddComponent(enemyComponentStringArry[index])
        enemy3Obj.transform.localPosition = Vector3(20, 0, 100)
        enemy3Obj.transform.eulerAngles = Vector3(0, 180, 0)

        index = Random.Range(0, 2)
        enemy4Obj as GameObject = Instantiate(characterResourceArray [index])
        enemy4Obj.AddComponent(enemyComponentStringArry[index])
        enemy4Obj.transform.localPosition = Vector3(30, 0, 100)
        enemy4Obj.transform.eulerAngles = Vector3(0, 180, 0)

    def Start ():
        pass

    def Update ():
        pass
