import UnityEngine

class GameMain (MonoBehaviour):

    public _hudObj as GameObject
    private _arrestKeeper as ArrestKeeper
    private _pointText as GUIText
    private _messageText as GUIText
    private _characterTypeText as GUIText
    private _point as int

    def Awake ():
        _arrestKeeper = ArrestKeeper()
        _pointText = _hudObj.transform.Find("PointText").GetComponent[of GUIText]()
        _messageText = _hudObj.transform.Find("MessageText").GetComponent[of GUIText]()
        _characterTypeText = _hudObj.transform.Find("CharacterTypeText").GetComponent[of GUIText]()
        _messageText.text = "Game Over"
        megamanPref as GameObject = (Resources.Load('Characters/megaman') as GameObject)
        marioPref as GameObject = (Resources.Load('Characters/mario') as GameObject)
        # [later add] linkPref as GameObject = (Resources.Load('Characters/link') as GameObject)
        characterResourceArray  as (GameObject) = array(GameObject, (megamanPref, marioPref))
        playerComponentStringArray as (string) = array(string, ("Megaman", "Mario", "Link"))
        playerNameStringArray as (string) = array(string, ("Megaman", "Mario", "Link"))
        enemyComponentStringArray as (string) = array(string, ("EnemyMegaman", "EnemyMario", "EnemyLink"))

        # player
        selectedIndex as int = Random.Range(0, 2)
        playerObj as GameObject = Instantiate(characterResourceArray[selectedIndex]);
        playerObj.AddComponent(playerComponentStringArray[selectedIndex])
        _characterTypeText.text = playerNameStringArray[selectedIndex]

        # enemies
        transform.parent =  playerObj.transform
        index as int = Random.Range(0, 2) # larer enemyComponentStringArray.length
        enemy1Obj as GameObject = Instantiate(characterResourceArray [index])
        enemy1Obj.AddComponent(enemyComponentStringArray[index])
        enemy1Obj.transform.localPosition = Vector3(-10, 0, 100)
        enemy1Obj.transform.eulerAngles = Vector3(0, 180, 0)

        index = Random.Range(0, 2)
        enemy2Obj as GameObject = Instantiate(characterResourceArray [index])
        enemy2Obj.AddComponent(enemyComponentStringArray[index])
        enemy2Obj.transform.localPosition = Vector3(10, 0, 100)
        enemy2Obj.transform.eulerAngles = Vector3(0, 180, 0)

        index = Random.Range(0, 2)
        enemy3Obj as GameObject = Instantiate(characterResourceArray [index])
        enemy3Obj.AddComponent(enemyComponentStringArray[index])
        enemy3Obj.transform.localPosition = Vector3(20, 0, 100)
        enemy3Obj.transform.eulerAngles = Vector3(0, 180, 0)

        index = Random.Range(0, 2)
        enemy4Obj as GameObject = Instantiate(characterResourceArray [index])
        enemy4Obj.AddComponent(enemyComponentStringArray[index])
        enemy4Obj.transform.localPosition = Vector3(30, 0, 100)
        enemy4Obj.transform.eulerAngles = Vector3(0, 180, 0)

    def Start ():
        pass

    def Update ():
        pass
