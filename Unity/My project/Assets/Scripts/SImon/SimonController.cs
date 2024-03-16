/*
Script to generate the sequence of buttons to show and then compare with the user inputs

Francisco Urquizo Schnaas
06/03/24
*/

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;


public class SimonController : MonoBehaviour
{
    [SerializeField] List<int> sequence;
    [SerializeField] GameObject[] buttons;
    [SerializeField] GameObject repeat;
    [SerializeField] TMP_Text scoreText;



    bool playerTurn = false;
    int index;
    public static int level;
    int curr_score;
    int highscore;
    bool repeats = true;

    // Start is called before the first frame update
    void Start()
    {
       highscore = PlayerPrefs.GetInt("highscore", 0);
       level = PlayerPrefs.GetInt("score", 0);
       UpdateScoreDisplay();
       
    }


    // Update is called once per frame
    void Update()
    {
        
    }

    // Start New Game
    public void newGame(){
        sequence = new List<int>();
        index = 0;
        level = 0;
        //PlayerPrefs.SetInt("highscore", 0);
        PlayerPrefs.SetInt("score", 0);
        repeats = true;
        AddNumber();
    }

    void AddNumber() 
    {
        playerTurn = false;
        index = 0;
        int num = Random.Range(0, buttons.Length);
        sequence.Add(num);
        StartCoroutine(ShowSequence());
        
    }


    public void CallShowSequence()
    {
        if (repeats && repeat != null)
        {
            Button repeatButton = repeat.GetComponent<Button>();
            if (repeatButton != null)
            {
                repeatButton.interactable = false;
            }
            
            StartCoroutine(ShowSequence());
        }

        repeats = false;
    }


    public IEnumerator ShowSequence() {
        yield return new WaitForSeconds(0.8f);
        for (int i = 0; i < sequence.Count; i++) 
        {
            int num = sequence[i];
            // Call a method on the Button script

            buttons[num].GetComponent<SimonButtons>().HighLight();
            yield return new WaitForSeconds(0.6f);
        }
        playerTurn = true;
    }

    


    public void ButtonSelect(int buttonID) {
        if (playerTurn) 
        {
            buttons[buttonID].GetComponent<SimonButtons>().HighLight();
            if (sequence[index] == buttonID) 
            {
                // Continue the sequence
                index++;
                // Check if we completed the sequence
                if (index == sequence.Count) {
                    level++;
                    curr_score++;
                    UpdateScoreDisplay();
                    // Update the highscore if the current level is greater than the previous highscore
                    if (level > highscore) {
                        highscore = level;
                        PlayerPrefs.SetInt("highscore", highscore);
                    }
                    PlayerPrefs.SetInt("score", level);
                    AddNumber();
                }
            } else 
            {
                // Game over
                UnityEngine.SceneManagement.SceneManager.LoadScene("SimonResults");
            }
        }
    }


    private void UpdateScoreDisplay()
    {
        if (scoreText != null)
        {
            scoreText.text = "SCORE: " + curr_score;
        }
    }

}

