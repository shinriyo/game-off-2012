import UnityEngine

class SelectScript (MonoBehaviour):

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
