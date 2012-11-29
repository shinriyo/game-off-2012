import UnityEngine

[RequireComponent(CharacterController)]
class PlayerBase (MonoBehaviour):

    protected _hp as int
    protected _gravity as single
    protected _speed as single
    protected _jumpSpeed as single
    protected _rotateSpeed as single
    protected _controller as CharacterController
    protected _onFloor as bool

    protected _moveDirection as Vector3 = Vector3.zero
    private static final IDLE as string = "Idle"
    private static final WALK as string = "Walk"
    private static final JUMP as string = "Jump"
    private static final PULL as string = "Pull"
    private static final PUSH as string = "Push"
    private _getyouSound as AudioClip
    private _arrestSound as AudioClip

    def Awake ():
        _getyouSound = (Resources.Load('Audio/getyou') as AudioClip)
        _arrestSound = (Resources.Load('Audio/sfx-deposit') as AudioClip)

        tag = "Player"
        _controller  = GetComponent(CharacterController)
        gameObject.AddComponent('AudioSource')

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

        if Input.GetButton("Jump") and _onFloor:
            Debug.Log("Jump")
            _onFloor = false
            _moveDirection.y = _jumpSpeed;
            if _jumpSpeed > 0.0F:
                animation.Play(JUMP)

        _controller.Move(_moveDirection * Time.deltaTime);

        if inputH or inputV:
            animation.CrossFade(WALK)
        else:
            animation.CrossFade(IDLE)

    def OnControllerColliderHit (hit as ControllerColliderHit):
        hitObj as GameObject = hit.gameObject
        hitObjTag as string = hitObj.tag
        if hitObjTag == "Enemy" :
            enemyJoint as HingeJoint = hit.gameObject.GetComponent(HingeJoint)
            if enemyJoint.connectedBody == null:
                enemyJoint.connectedBody = rigidbody
                audio.clip = _getyouSound
                audio.Play()

        elif hitObjTag == "Floor" :
            _onFloor = true

        elif hitObjTag == "Jail" :
            PushJail()

        elif hitObjTag == "Item" :
            Destroy(hitObj);
            _speed += 10
            _rotateSpeed += 10

    private def PushJail ():
        cnt as int = 0
        for enemyObj as GameObject in GameObject.FindGameObjectsWithTag("Enemy"):
            enemyTrans as Transform = enemyObj.transform
            enemyJoint as HingeJoint = enemyTrans.GetComponent(HingeJoint)
            # grubbed
            if enemyJoint.connectedBody:
                enemyObj.GetComponent(EnemyBase).ArrestFlag = true
                enemyTrans.localPosition = Vector3(Random.Range(5, 13), 0, -Random.Range(5, 13))
                enemyJoint.connectedBody = null
                cnt+=1
        if cnt > 0:
            audio.clip = _arrestSound
            audio.Play()

