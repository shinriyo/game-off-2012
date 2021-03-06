import UnityEngine

public enum EnemyState:
    None
    Search
    Chase

class EnemyBase (MonoBehaviour):

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

    private _targetTrans as Transform
    private _myState as EnemyState

    [Property(ArrestFlag)]
    private _arrestFlag as bool

    def Awake ():
        tag = "Enemy"

    def Start ():
        animation.Play(IDLE)

    def Update ():
        #animation.Play(IDLE)

        if _myState == EnemyState.Search:
            avoidObj as GameObject = GameObject.FindGameObjectWithTag("Player")
            targetObj as GameObject = GameObject.FindGameObjectWithTag("Jail")
            _targetTrans = avoidObj.transform
            _myState = EnemyState.Chase
        elif _myState == EnemyState.Chase:
            vec as Vector3 = (_targetTrans.localPosition - transform.localPosition).normalized
            vec.y = 0
            transform.localPosition += vec * _speed
