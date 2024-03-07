/*
Highlight a button and detect when it is clicked

Francisco Urquizo Schnaas
06/03/24
*/

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class SimonButton : MonoBehaviour
{
    
    Color originalColor;

    void Start()
    {
        originalColor = GetComponent<Image>().color;
    }
    
    public void HighLight()
    {
        StartCoroutine(ChangeColor());
    }

    IEnumerator ChangeColor()
    {
        GetComponent<Image>().color = Color.white;
        yield return new WaitForSeconds(0.5f);
        GetComponent<Image>().color = originalColor;
    }
}