import UnityEngine

class Mario (PlayerBase):
    def Awake():
        super.Awake()
        _gravity = 9.8F
        _rotateSpeed = 170
        _speed = 20
