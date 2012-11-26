import UnityEngine

class ArrestKeeper ():
    private _arrestedEnemies as List = []

    public def Register (trans as Transform):
        _arrestedEnemies.Add(trans)

    public def PushJail ():
        for enemyTrans as Transform in _arrestedEnemies:
            enemyTrans.localPosition = Vector3(Random.Range(2, 13), 0, -Random.Range(2, 13))
            enemyJoint as HingeJoint = enemyTrans.GetComponent(HingeJoint)
            enemyJoint.connectedBody = null

        _arrestedEnemies = []
