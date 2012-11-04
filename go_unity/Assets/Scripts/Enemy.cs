using UnityEngine;
using System.Collections;
public class Enemy : MonoBehaviour
{
    private bool _startedFlag = false;
    void Awake()
    {
        // Event Add
    }
    void Start()
    {
        Init();
        _startedFlag = true;
    }
    void OnEnable()
    {
        if (!_startedFlag) return;
        Init();
    }
    void OnDisable()
    {
        if (!_startedFlag) return;
        Format();
    }
    void OnDestroy()
    {
        // Event Remove
    }
    void Update()
    {
    }
    public void Init()
    {
    }
    public void Format()
    {
    }
}
