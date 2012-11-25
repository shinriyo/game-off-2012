class Mario (PlayerBase):
    def Awake():
        super.Awake()
        _gravity = 9.8F
        _rotateSpeed = 170
        _speed = 20
        _jumpSpeed = 100.0F
        _controller.center = Vector3(0, 3.5F, 0)
        _controller.radius = 2
        _controller.height = 7
