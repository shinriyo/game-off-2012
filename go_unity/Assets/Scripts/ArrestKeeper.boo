import UnityEngine

class ArrestKeeper ():
    private _arrested = []

    public def Register (obj as GameObject):
        _arrested.Add(obj)

