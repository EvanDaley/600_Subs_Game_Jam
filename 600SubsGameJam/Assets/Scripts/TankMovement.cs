using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class TankMovement : MonoBehaviour {
	
	public Vector3 moveTarget;
	public GameObject waypointInstance;
	public NavMeshAgent navMeshAgent;

	void Start()
	{
		navMeshAgent = GetComponent<NavMeshAgent> ();
	}

	void Update () {
		if (Input.GetButton ("Fire2"))
		{
			moveTarget = MouseTracking.Instance.HitPosition;
			//print (moveTarget);

			if (waypointInstance == null)
			{
				waypointInstance = GameObject.CreatePrimitive (PrimitiveType.Cube);
				waypointInstance.gameObject.layer = 2;
			}
			waypointInstance.transform.position = moveTarget;

			HandleMovement ();
		}
	}

	void HandleMovement()
	{
		navMeshAgent.SetDestination (moveTarget);
	}
}
