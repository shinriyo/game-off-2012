class Megaman (PlayerBase):
    def Awake():
        super.Awake()
        _gravity = 9.8F
        _rotateSpeed = 150
        _speed = 10
        _jumpSpeed = 340.0F
        _controller.center = Vector3(0, 3.5F, 0)
        _controller.radius = 2
        _controller.height = 7