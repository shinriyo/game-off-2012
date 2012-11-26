import UnityEngine

class GameMain (MonoBehaviour):

    public _hudObj as GameObject
    private MAX_ENEMY_COUNT as int = 4
    private _pointText as GUIText
    private _messageText as GUIText
    private _characterTypeText as GUIText
    private _timerText as GUIText
    private _point as int
    private _timer as single = 60
    private _isClear as bool

    def Awake ():
        _pointText = _hudObj.transform.Find("PointText").GetComponent[of GUIText]()
        _pointText.text = _point.ToString() + "/ " + MAX_ENEMY_COUNT.ToString()
        _messageText = _hudObj.transform.Find("MessageText").GetComponent[of GUIText]()
        _characterTypeText = _hudObj.transform.Find("CharacterTypeText").GetComponent[of GUIText]()
        _timerText = _hudObj.transform.Find("TimerText").GetComponent[of GUIText]()

        megamanPref as GameObject = (Resources.Load('Characters/megaman') as GameObject)
        marioPref as GameObject = (Resources.Load('Characters/mario') as GameObject)
        linkPref as GameObject = (Resources.Load('Characters/link') as GameObject)
        characterResourceArray  as (GameObject) = array(GameObject, (megamanPref, marioPref, linkPref))
        playerComponentStringArray as (string) = array(string, ("Megaman", "Mario", "Link"))
        playerNameStringArray as (string) = array(string, ("Megaman", "Mario", "Link"))
        enemyComponentStringArray as (string) = array(string, ("EnemyMegaman", "EnemyMario", "EnemyLink"))

        # player
        selectedIndex as int = Random.Range(0, 3)
        playerObj as GameObject = Instantiate(characterResourceArray[selectedIndex]);
        playerObj.AddComponent(playerComponentStringArray[selectedIndex])
        _characterTypeText.text = playerNameStringArray[selectedIndex]
        playerRB as Rigidbody = playerObj.AddComponent[of Rigidbody]();
        playerRB.freezeRotation = true

        # enemies
        transform.parent =  playerObj.transform
        index as int = Random.Range(0, characterResourceArray.Length)
        enemy1Obj as GameObject = Instantiate(characterResourceArray[index])
        enemy1Obj.AddComponent(enemyComponentStringArray[index])
        enemy1Obj.transform.localPosition = Vector3(-10, 0, 100)
        enemy1Obj.transform.eulerAngles = Vector3(0, 180, 0)
        enemy1Obj.AddComponent[of HingeJoint]()
        enemy1RB as Rigidbody = enemy1Obj.GetComponent[of Rigidbody]();
        enemy1RB.constraints = RigidbodyConstraints.FreezePositionY | RigidbodyConstraints.FreezeRotation
        enemy1Obj.AddComponent[of CapsuleCollider]()

        index = Random.Range(0, characterResourceArray.Length)
        enemy2Obj as GameObject = Instantiate(characterResourceArray[index])
        enemy2Obj.AddComponent(enemyComponentStringArray[index])
        enemy2Obj.transform.localPosition = Vector3(10, 0, 100)
        enemy2Obj.transform.eulerAngles = Vector3(0, 180, 0)
        enemy2Obj.AddComponent[of HingeJoint]()
        enemy2RB as Rigidbody = enemy2Obj.GetComponent[of Rigidbody]();
        enemy2RB.constraints = RigidbodyConstraints.FreezePositionY | RigidbodyConstraints.FreezeRotation
        enemy2Obj.AddComponent[of CapsuleCollider]()

        index = Random.Range(0, characterResourceArray.Length)
        enemy3Obj as GameObject = Instantiate(characterResourceArray[index])
        enemy3Obj.AddComponent(enemyComponentStringArray[index])
        enemy3Obj.transform.localPosition = Vector3(20, 0, 100)
        enemy3Obj.transform.eulerAngles = Vector3(0, 180, 0)
        enemy3Obj.AddComponent[of HingeJoint]()
        enemy3RB as Rigidbody = enemy3Obj.GetComponent[of Rigidbody]();
        enemy3RB.constraints =RigidbodyConstraints.FreezePositionY | RigidbodyConstraints.FreezeRotation
        enemy3Obj.AddComponent[of CapsuleCollider]()

        index = Random.Range(0, characterResourceArray.Length)
        enemy4Obj as GameObject = Instantiate(characterResourceArray[index])
        enemy4Obj.AddComponent(enemyComponentStringArray[index])
        enemy4Obj.transform.localPosition = Vector3(30, 0, 100)
        enemy4Obj.transform.eulerAngles = Vector3(0, 180, 0)
        enemy4Obj.AddComponent[of HingeJoint]()
        enemy4RB as Rigidbody = enemy4Obj.GetComponent[of Rigidbody]();
        enemy4RB.constraints = RigidbodyConstraints.FreezePositionY | RigidbodyConstraints.FreezeRotation
        enemy4Obj.AddComponent[of CapsuleCollider]()

    def Start ():
        pass

    def Update ():
        arrestedEnemyCnt as int = 0
        for enemyObj as GameObject in GameObject.FindGameObjectsWithTag("Enemy"):
            arrestFlag as bool = enemyObj.GetComponent(EnemyBase).ArrestFlag
            if arrestFlag:
                arrestedEnemyCnt++
                _point = arrestedEnemyCnt
                _pointText.text = _point.ToString() + "/ " + MAX_ENEMY_COUNT.ToString()

        if arrestedEnemyCnt == MAX_ENEMY_COUNT:
            _isClear = true
            _messageText.text = "Game Clear"

        if not _isClear:
            _timer -= Time.deltaTime

        intVal as int = _timer

        if intVal < 0:
            _messageText.text = "Game Over"
        else:
            _timerText.text = intVal.ToString()

    def OnGUI ():
        if GUI.Button(Rect(Screen.width/2, Screen.height/2 + 80, 50, 30), 'Click'):
            pass
