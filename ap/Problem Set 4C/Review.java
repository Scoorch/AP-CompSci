import java.util.Scanner;
import java.io.File;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.Random;
import java.io.*;

/**
 * Class that contains helper methods for the Review Lab
 **/
public class Review {

    private static HashMap<String, Double> sentiment = new HashMap<String, Double>();
    private static ArrayList<String> posAdjectives = new ArrayList<String>();
    private static ArrayList<String> negAdjectives = new ArrayList<String>();

    private static final String SPACE = " ";
    static{
        try {
            Scanner input = new Scanner(new File("cleanSentiment.csv"));
            while(input.hasNextLine()){
                String[] temp = input.nextLine().split(",");
                sentiment.put(temp[0],Double.parseDouble(temp[1]));
                //System.out.println("added "+ temp[0]+", "+temp[1]);
            }
            input.close();
        }
        catch(Exception e){
            System.out.println("Error reading or parsing cleanSentiment.csv");
        }

        //read in the positive adjectives in postiveAdjectives.txt
        try {
            Scanner input = new Scanner(new File("positiveAdjectives.txt"));
            while(input.hasNextLine()){
                String temp = input.nextLine().trim();
                // System.out.println(temp);
                posAdjectives.add(temp);
            }
            input.close();
        }
        catch(Exception e){
            System.out.println("Error reading or parsing postitiveAdjectives.txt\n" + e);
        }   

        //read in the negative adjectives in negativeAdjectives.txt
        try {
            Scanner input = new Scanner(new File("negativeAdjectives.txt"));
            while(input.hasNextLine()){
                negAdjectives.add(input.nextLine().trim());
            }
            input.close();
        }
        catch(Exception e){
            System.out.println("Error reading or parsing negativeAdjectives.txt");
        }   
    }

    /** 
     * returns a string containing all of the text in fileName (including punctuation), 
     * with words separated by a single space 
     */
    public static String textToString( String fileName )
    {  
        String temp = "";
        try {
            Scanner input = new Scanner(new File(fileName+".txt"));

            //add 'words' in the file to the string, separated by a single space
            while(input.hasNext()){
                temp = temp + input.next() + " ";
            }
            input.close();

        }
        catch(Exception e){
            System.out.println("Unable to locate " + fileName);
        }
        //make sure to remove any additional space that may have been added at the end of the string.
        return temp.trim();
    }

    /**
     * @returns the sentiment value of word as a number between -1 (very negative) to 1 (very positive sentiment) 
     */
    public static double sentimentVal( String word )
    {
        try
        {
            return sentiment.get(word.toLowerCase());
        }
        catch(Exception e)
        {
            return 0;
        }
    }

    /**
     * Returns the ending punctuation of a string, or the empty string if there is none 
     */
    public static String getPunctuation( String word )
    { 
        String punc = "";
        for(int i=word.length()-1; i >= 0; i--){
            if(!Character.isLetterOrDigit(word.charAt(i))){
                punc = punc + word.charAt(i);
            } else {
                return punc;
            }
        }
        return punc;
    }

    /**
     * Returns the word after removing any beginning or ending punctuation
     */
    public static String removePunctuation( String word )
    {
        while(word.length() > 0 && !Character.isAlphabetic(word.charAt(0)))
        {
            word = word.substring(1);
        }
        while(word.length() > 0 && !Character.isAlphabetic(word.charAt(word.length()-1)))
        {
            word = word.substring(0, word.length()-1);
        }

        return word;
    }

    /** 
     * Randomly picks a positive adjective from the positiveAdjectives.txt file and returns it.
     */
    public static String randomPositiveAdj()
    {
        int index = (int)(Math.random() * posAdjectives.size());
        return posAdjectives.get(index);
    }

    /** 
     * Randomly picks a negative adjective from the negativeAdjectives.txt file and returns it.
     */
    public static String randomNegativeAdj()
    {
        int index = (int)(Math.random() * negAdjectives.size());
        return negAdjectives.get(index);

    }

    /** 
     * Randomly picks a positive or negative adjective and returns it.
     */
    public static String randomAdjective()
    {
        boolean positive = Math.random() < .5;
        if(positive){
            return randomPositiveAdj();
        } else {
            return randomNegativeAdj();
        }
    }

    public static String sentimentStar(String fileName) {
        return totalSentiment(fileName)+", "+starRating(fileName);
    }

    public static double totalSentiment(String fileName) {
        String s = textToString(fileName);
        double tot = 0;
        for (int i = s.indexOf(" "); i < s.length(); i = s.indexOf(" ", i+1)) {
            if (s.indexOf(" ", i+1) == -1) {
                tot += sentimentVal(removePunctuation(s.substring(i+1)));
                System.out.println(tot+s.substring(i+1));
                break;
            }
            tot += sentimentVal(removePunctuation(s.substring(i+1, s.indexOf(" ", i+1))));
            // System.out.println(tot+s.substring(i+1, s.indexOf(" ", i+1)));
        }
        System.out.println(Math.round(0.1)+" "+ Math.round(0.9));
        return (double)Math.round(tot*100)/100;
    }

    public static int starRating(String fileName) {
        if ((int)Math.abs(Math.round(totalSentiment(fileName)/5)) == 0) return 1;  
        return (int)Math.abs(Math.round(totalSentiment(fileName)/5));
    }

    public static String fakeReview(String fileName) {
        String s = textToString(fileName);
        // for (int i = 0; s.indexOf("*") != -1; i = s.indexOf("*", i+1)) {

        // }
        while (s.indexOf("*") != -1) {
            if (totalSentiment(s) >= 0) {
                if (sentimentVal(removePunctuation(s.substring(s.indexOf("*")+1, s.indexOf(" ", s.indexOf("*"))))) <= 0) {
                    s = s.substring(0, s.indexOf("*")) +randomPositiveAdj()+ s.substring(s.indexOf(" ", s.indexOf("*")+1));
                } else s = s.substring(0, s.indexOf("*")) + s.substring(s.indexOf("*")+1);
            } else {
                if (sentimentVal(removePunctuation(s.substring(s.indexOf("*")+1, s.indexOf(" ", s.indexOf("*")))    )) >= 0) {
                    s = s.substring(0, s.indexOf("*")) +randomNegativeAdj()+ s.substring(s.indexOf(" ", s.indexOf("*")+1));
                } else s = s.substring(0, s.indexOf("*")) + s.substring(s.indexOf("*")+1);
            }
        }
        return s;
    }

    public static void e(int x, int y) {
        for (int i = 0; i < y; i++) {
            for (int j = 0; j < x; j++) System.out.print("*");
            System.out.println();
        }
    }

    public static void longestStreak(String str) {
        int streak = 0;
        char letter = ' ';
        int current = 0;
        for (int i = 0; i < str.length(); i++) {
            for (int j = i; j < str.length(); j++) {
                if (str.charAt(j) == str.charAt(i)) {
                    current++;
                } else {
                    break;
                }
            }
            if (current > streak) {
                streak = current;
                letter = str.charAt(i);
            }
            current = 0;
        }
        System.out.println(letter + " " + streak);
    }
    
    public static int a(int round) {
        int result;
        if (round%3 == 0) result = 3; else if (round%2 == 0) result = 2; else result = 1;
        return result;
    }
}