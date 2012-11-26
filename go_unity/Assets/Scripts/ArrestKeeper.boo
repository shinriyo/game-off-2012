import UnityEngine

class ArrestKeeper ():
    private _arrestedEnemies as List = []
    private static _arrestKeeper as ArrestKeeper

    def constructor ():
        if _arrestKeeper == null:
            _arrestKeeper = self

    public static def Instance () as ArrestKeeper:
        return _arrestKeeper

    public def Register (trans as Transform):
        _arrestedEnemies.Add(trans)

    public def ArrestedEnemiesNum () as int:
        return _arrestedEnemies.Count

    public def PushJail ():
        for enemyTrans as Transform in _arrestedEnemies:
            enemyTrans.localPosition = Vector3(Random.Range(2, 13), 0, -Random.Range(2, 13))
            enemyJoint as HingeJoint = enemyTrans.GetComponent(HingeJoint)
            enemyJoint.connectedBody = null

        _arrestedEnemies = []
