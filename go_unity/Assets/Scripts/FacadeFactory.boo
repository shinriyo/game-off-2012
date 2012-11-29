import UnityEngine

class FacadeFactory (MonoBehaviour):

    public facadePref as GameObject
    private static final SCALE as Vector3 = Vector3.one * 3

    def Awake ():
        # left
        for z in range(0, 37):
            leftFacadeInstance as GameObject = Instantiate(facadePref)
            leftFacadeInstance.name = "LeftFacade"
            leftFacadeTrans as Transform = leftFacadeInstance.transform
            leftFacadeTrans.parent = transform
            leftFacadeTrans.localPosition = Vector3(-100, 1, z*50)
            leftFacadeTrans.localScale = SCALE

        # front
        for x in range(0, 37):
            frontFacadeInstance as GameObject = Instantiate(facadePref)
            frontFacadeInstance.name = "FrontFacade"
            facadeFrontTrans as Transform = frontFacadeInstance.transform
            facadeFrontTrans.parent = transform
            facadeFrontTrans.localPosition = Vector3(-50+x*50, 1, 1800)
            facadeFrontTrans.localScale = SCALE
            // 270, 90, 0
            facadeFrontTrans.rotation = Quaternion.AngleAxis(90, Vector3.up) * Quaternion.AngleAxis(270, Vector3.right)

        # right
        for z in range(0, 37):
            rightFacadeInstance as GameObject = Instantiate(facadePref)
            rightFacadeInstance.name = "RightFacade"
            rightFacadeTrans as Transform = rightFacadeInstance.transform
            rightFacadeTrans.parent = transform
            rightFacadeTrans.localPosition = Vector3(1750, 1, z*50)
            rightFacadeTrans.localScale = SCALE
            # 270, 180, 0
            rightFacadeTrans.rotation = Quaternion.AngleAxis(180, Vector3.up) * Quaternion.AngleAxis(270, Vector3.right)

    def Start ():
        pass

    def Update ():
        pass
