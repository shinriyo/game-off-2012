import UnityEngine

[RequireComponent(CharacterController)]
class PlayerBase (MonoBehaviour):

    private _hp as int
    private gravity as single = 20.0F
    private moveDirection as Vector3 = Vector3.zero
    static final IDLE as string = "Idle"
    static final WALK as string = "Walk"

    def Start ():
        animation.Play(IDLE)

    def Update ():
        pass

    def FixedUpdate ():
        inputH as  bool = false
        inputV as bool = false

        controller = GetComponent(CharacterController)
        moveDirection = Vector3.zero
        moveDirection.y -= gravity * Time.deltaTime

        if Mathf.Abs(Input.GetAxisRaw("Horizontal")) > 0.5:
            inputH = true
            transform.eulerAngles.y += Input.GetAxis("Horizontal")

        if (Mathf.Abs(Input.GetAxisRaw("Vertical")) > 0.5):
            inputV = true
            moveDirection += transform.forward

        controller.Move(moveDirection * Time.deltaTime);

        if inputH or inputV:
            animation.CrossFade(WALK)
        else:
            animation.CrossFade(IDLE)
