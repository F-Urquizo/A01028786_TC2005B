using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class SimonHighScores : MonoBehaviour
{
    [SerializeField] TMP_Text highscoreText;
    // Start is called before
    void Start()
    {
        int highscore = PlayerPrefs.GetInt("highscore", 0);
        highscoreText.text = "HIGHSCORE: " + highscore;
    }
}