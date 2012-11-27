import UnityEngine

class SelectedCharacter (MonoBehaviour):

    static final IDLE as string = "Idle"

    def Start ():
        pass

    def Update ():
        animation.Play(IDLE)
