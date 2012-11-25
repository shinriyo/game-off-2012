import UnityEngine

[RequireComponent(CharacterController)]
class PlayerBase (MonoBehaviour):

    protected _hp as int
    protected _gravity as single
    protected _speed as single
    protected _rotateSpeed as single

    private moveDirection as Vector3 = Vector3.zero
    static final IDLE as string = "Idle"
    static final WALK as string = "Walk"
    static final PULL as string = "Pull"
    static final PUSH as string = "Push"

    def Awake ():
        tag = "Player"

    def Start ():
        animation.Play(IDLE)

    def Update ():
        pass

    def FixedUpdate ():
        inputH as  bool = false
        inputV as bool = false

        controller = GetComponent(CharacterController)
        moveDirection = Vector3.zero
        moveDirection.y -= _gravity * Time.deltaTime

        if Mathf.Abs(Input.GetAxisRaw("Horizontal")) > 0.5:
            inputH = true
            transform.eulerAngles.y += Input.GetAxis("Horizontal") * Time.deltaTime * _rotateSpeed

        if (Mathf.Abs(Input.GetAxisRaw("Vertical")) > 0.5):
            inputV = true
            moveDirection += transform.forward * Input.GetAxis("Vertical") * _speed

        controller.Move(moveDirection * Time.deltaTime);

        if inputH or inputV:
            animation.CrossFade(WALK)
        else:
            animation.CrossFade(IDLE)

    def OnColliderEnter ( other as GameObject):
        if other.tag == "Enemy" :
            pass
