import UnityEngine
import System.Collections

class SelectScript (MonoBehaviour):

    public selectedSound as AudioClip
    public letsgoSound as AudioClip
    private static BUTTON_WIDTH as int = 200
    private static BUTTON_HEIGHT as int = 160
    private static OFFSET as int = 30
    private static URL as string = "https://github.com/shinriyo/game-off-2012"

    def Start ():
        megamanPref as GameObject = (Resources.Load('Characters/megaman') as GameObject)
        marioPref as GameObject = (Resources.Load('Characters/mario') as GameObject)
        linkPref as GameObject = (Resources.Load('Characters/link') as GameObject)

        megamanObj as GameObject = Instantiate(megamanPref)
        megamanObj.AddComponent(SelectedCharacter);
        megamanObj.transform.localPosition = Vector3.left * 10
        megamanObj.transform.eulerAngles = Vector3(0, 180, 0)

        marioObj as GameObject = Instantiate(marioPref)
        marioObj.AddComponent(SelectedCharacter);
        marioObj.transform.eulerAngles = Vector3(0, 180, 0)

        linkObj as GameObject = Instantiate(linkPref)
        linkObj.transform.localPosition = Vector3.right * 10
        linkObj.AddComponent(SelectedCharacter);
        linkObj.transform.eulerAngles = Vector3(0, 180, 0)


    def Update ():
        pass

    def OnGUI ():
        if GUI.Button(Rect(OFFSET, OFFSET, 140, 40), 'github source code'):
            Application.OpenURL(URL)

        if GUI.Button(Rect(OFFSET, Screen.height/2+80, BUTTON_WIDTH, BUTTON_HEIGHT), 'Megaman'):
            GameManager.selectedCharacter = MyCharacter.MEGAMAN
            StartCoroutine(GoGameScene())

        if GUI.Button(Rect(Screen.width/2 - BUTTON_WIDTH/2, Screen.height/2 + 80, BUTTON_WIDTH, BUTTON_HEIGHT), 'Mario'):
            GameManager.selectedCharacter = MyCharacter.MARIO
            StartCoroutine(GoGameScene())

        if GUI.Button(Rect(Screen.width - OFFSET - BUTTON_WIDTH, Screen.height/2 + 80, BUTTON_WIDTH, BUTTON_HEIGHT), 'Link'):
            GameManager.selectedCharacter = MyCharacter.LINK
            StartCoroutine(GoGameScene())

    def GoGameScene () as IEnumerator:
        audio.clip = selectedSound
        audio.Play()
        yield WaitForSeconds(1.5F)
        audio.clip = letsgoSound
        audio.Play()
        yield WaitForSeconds(1)

        Application.LoadLevel(1)
