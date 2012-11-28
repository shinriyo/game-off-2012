import UnityEngine

public enum MyCharacter:
    NONE
    MEGAMAN
    MARIO
    LINK

class GameManager (MonoBehaviour):

    public static selectedCharacter as MyCharacter

    def Awake():
        DontDestroyOnLoad(transform.gameObject)
