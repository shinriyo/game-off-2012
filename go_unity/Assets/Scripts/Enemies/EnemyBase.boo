import UnityEngine

class EnemyBase (MonoBehaviour):

    protected _hp as int
    protected _gravity as single
    protected _speed as single
    protected _jumpSpeed as single
    protected _rotateSpeed as single
    protected _controller as CharacterController
    protected _onFloor as bool

    protected _moveDirection as Vector3 = Vector3.zero
    static final IDLE as string = "Idle"
    static final WALK as string = "Walk"
    static final JUMP as string = "Jump"
    static final PULL as string = "Pull"
    static final PUSH as string = "Push"

    [Property(ArrestFlag)]
    private _arrestFlag as bool

    def Awake ():
        tag = "Enemy"

    def Start ():
        pass

    def Update ():
        pass
