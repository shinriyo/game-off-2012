import UnityEngine

class JailFactory (MonoBehaviour):
    jailCylinderPref as GameObject

    def Awake ():
        jailCylinderPref = Resources.Load("JailCylinder")

        for x in range(1, 20):
            jailCylinderObj as GameObject = Instantiate(jailCylinderPref)
            trans as Transform = jailCylinderObj.transform
            trans.parent = transform
            trans.localPosition = Vector3(x, 5, 0)

        for x in range(1, 20):
            jailCylinderObj2 as GameObject = Instantiate(jailCylinderPref)
            trans2 as Transform = jailCylinderObj2.transform
            trans2.parent = transform
            trans2.localPosition = Vector3(x, 5, -20)

        for z in range(1, 18):
            jailCylinderObj3 as GameObject = Instantiate(jailCylinderPref)
            trans3 as Transform = jailCylinderObj3.transform
            trans3.parent = transform
            trans3.localPosition = Vector3(0, 5, z-20)

        for z in range(1, 18):
            jailCylinderObj4 as GameObject = Instantiate(jailCylinderPref)
            trans4 as Transform = jailCylinderObj4.transform
            trans4.parent = transform
            trans4.localPosition = Vector3(20, 5, z-20)

    def Start ():
        pass

    def Update ():
        pass
