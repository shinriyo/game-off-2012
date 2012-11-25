import UnityEngine

[RequireComponent(CharacterController)]
class PlayerBase (MonoBehaviour):

    protected _hp as int
    protected _gravity as single
    protected _speed as single
    protected _jumpSpeed as single
    protected _rotateSpeed as single
    protected _controller as CharacterController

    protected _moveDirection as Vector3 = Vector3.zero
    static final IDLE as string = "Idle"
    static final WALK as string = "Walk"
    static final PULL as string = "Pull"
    static final PUSH as string = "Push"

    def Awake ():
        tag = "Player"
        _controller  = GetComponent(CharacterController)

    def Start ():
        animation.Play(IDLE)

    def Update ():
        pass

    def FixedUpdate ():
        inputH as  bool = false
        inputV as bool = false

        _moveDirection = Vector3.zero
        _moveDirection.y -= _gravity

        if Mathf.Abs(Input.GetAxisRaw("Horizontal")) > 0.5:
            inputH = true
            transform.eulerAngles.y += Input.GetAxis("Horizontal") * Time.deltaTime * _rotateSpeed

        if (Mathf.Abs(Input.GetAxisRaw("Vertical")) > 0.5):
            inputV = true
            _moveDirection += transform.forward * Input.GetAxis("Vertical") * _speed

        if Input.GetButton("Jump"):
            Debug.Log("Jump")
            _moveDirection.y = _jumpSpeed;

        _controller.Move(_moveDirection * Time.deltaTime);

        if inputH or inputV:
            animation.CrossFade(WALK)
        else:
            animation.CrossFade(IDLE)

    def OnCollisionEnter (collision as Collision):
        Debug.Log("hit")
        if collision.gameObject.tag == "Enemy" :
            enemyJoint as HingeJoint = collision.gameObject.GetComponent(HingeJoint)
            enemyJoint.connectedBody = rigidbody

        if collision.gameObject.tag == "Floor" :
            Debug.Log("Floor")
