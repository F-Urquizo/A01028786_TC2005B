using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
/*
public class SimonScores : MonoBehaviour
{
    [SerializeField] TMP_Text scoreText;
    // Start is called before
    void Start()
    {
        int score = PlayerPrefs.GetInt("score", 0);
        scoreText.text = "SCORE: " + score;
    }
}
*/

// SimonScores.cs
public class SimonScores : MonoBehaviour
{
    [SerializeField] TMP_Text scoreText;


    void Start()
    {
        scoreText.text = "SCORE: " + SimonController.level.ToString();
    }
}
