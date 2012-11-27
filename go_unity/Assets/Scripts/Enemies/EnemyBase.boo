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

    private targetTrans as Transform
    private _myState as EnemyState

    [Property(ArrestFlag)]
    private _arrestFlag as bool

    def Awake ():
        tag = "Enemy"

    def Start ():
        pass

    def Update ():
        if _myState == EnemyState.Search:
            enemies as (GameObject) = GameObject.FindGameObjectsWithTag("Enemy")
            index as int = Random.Range(0, enemies.Length)
            _myState = EnemyState.Chase
        elif _myState == EnemyState.Chase:
            pass
