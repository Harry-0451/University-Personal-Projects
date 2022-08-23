import java.util.*;

public class exer1 {
    
    //Creates variables to hold the number of times a letter shows up.
    static int a1,b1,c1,d1,e1,f1,g1,h1,i1,j1,k1,l1,m1,n1,o1,p1,q1,r1,s1,t1,u1,v1,w1,x1,y1,z1;
    public static void main(String args[]) {

        //This holds the values of the coded text, the key to decode the text and the decrypted text.
        String textInFile = "DYCZDCVQZNZKVMVOZYAMJHHTRDAZAJMKZMNJIVGIJOQJTVBDIBMZVNJINDHVTIZQZMGDQZRDOCCZMVBVDIDHVTIJOWZVWGZOJGJQZTJPWPORDGGTJPBJRDOCHZDINOZVYJACZMTJPOMPGTRDNCHZOJBJDYJDCVQZWZZIWVYGTPNZYZIJPBCOJRDNCAJMMZGDZAVIYTJPVOGZVNOGJQZHZYDNDIOZMZNOZYGTTZNDRDGGBJNVDYDUUVAOZMVKVPNZTJPRDGGTJPFIJRRCVODOHZVINDUUDOHZVINOCVODNCVGGGDQZRDOCTJPAJMOCZODHZTJPVMZJQZMOCZMZOCVONBJJYZIJPBCAJMHZMZHZHWZMTJPVMZIJOOJOMPNOHZDIHJMVGNIJRWPODJPBCOOJMZHDIYTJPOCVODORDGGWZRMJIBYJDIBDIOCZZTZNJAXDQDGDUVODJIRZNOZMIXDQDGDUVODJIOCVODNOJNVTDYJIOHDIYOCVOIJRJHVIYJRCZIDOXJHZNOJVBJITKJDIOVIYOCZMZNIJJOCZMRVTOCZIYJIOBZOYJRIWPONDORCZMZTJPVMZCZYMJQZKVNOOCZXMJNNMJVYNJIZHDGZORJHDGZNRDOCJPONCJRDIBVITNDBINJAVAAZXODJITJPGJQZHZQZMTQZMTHPXCDUUCZNPYYZIGTVNFZYDYJDCVQZNVDYDYJDGJQZYTJPVGGOCZODHZRZRVNVOOCZYVDMTOJBZOCZMHJMZOCVIOZNNNCZNCJJFCZMCZVYIJNCZHPMHPMZYIJOHJMZOCVINCZCJRNOCVOWZXVPNZIJWJYTXJPGYGJQZZZH";
        String key ="";
        String decrpytedText = "";
        
        //This for loop goes through every character and adds up the occurence of each letter.
        for(int chara=0; chara < textInFile.length(); chara++){
            switch(Character.toString(textInFile.charAt(chara))){
                case "A":
                    a1++;
                    break;
                case "B":
                    b1++;
                    break;
                case "C":
                    c1++;
                    break;
                case "D":
                    d1++;
                    break;
                case "E":
                    e1++;
                    break;
                case "F":
                    f1++;
                    break;
                case "G":
                    g1++;
                    break;
                case "H":
                    h1++;
                    break;
                case "I":
                    i1++;
                    break;
                case "J":
                    j1++;
                    break;
                case "K":
                    k1++;
                    break;
                case "L":
                    l1++;
                    break;
                case "M":
                    m1++;
                    break;
                case "N":
                    n1++;
                    break;
                case "O":
                    o1++;
                    break;
                case "P":
                    p1++;
                    break;
                case "Q":
                    q1++;
                    break;
                case "R":
                    r1++;
                    break;
                case "S":
                    s1++;
                    break;
                case "T":
                    t1++;
                    break;
                case "U":
                    u1++;
                    break;
                case "V":
                    v1++;
                    break;
                case "W":
                    w1++;
                    break;
                case "X":
                    x1++;
                    break;
                case "Y":
                    y1++;
                    break;
                case "Z":
                    z1++;
                    break;
            }
        }

        //Each occurence is then put into an array in alphabetical order.
        int count[] = {a1, b1, c1, d1, e1, f1, g1, h1, i1, j1, k1, l1, m1, n1, o1, p1, q1, r1, s1, t1, u1, v1, w1, x1, y1, z1};

        //A small algorithm sorts through the array to find the largest value, and copies the index to the variable max.
        int max = 0;
        for(int letterOccurence = 0; letterOccurence <= 25 ;letterOccurence++){
            if(count[letterOccurence] > max){
                max = letterOccurence;
            }
        }

        //A standard alphabet in an array is created to corrolate with the counting array.
        String[] alphabet = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};

        //This is to make sure that the most common occurence - E isn't out of bounds and loops back to the other end of the array..
        if((max-4) < 0){
            if((max-3) < 0){
                if((max-2) < 0){
                    if((max-1) < 0){
                        key = alphabet[22];
                    }
                    else{
                        key = alphabet[23];
                    }
                }
                else{
                    key = alphabet[24];
                }
            }
            else{
                key = alphabet[25];
            }
        }
        else{
            key = alphabet[max-4];
        }
        
        //The number of times each letter needs to be shifted is then outputted.
        System.out.println("The shift key is: " + key);

        //This loop then shifts each character the needed number of times and adds it to the decrypted text string.
        for (int currentChar = 0; currentChar < textInFile.length(); currentChar++){
            char character = textInFile.charAt(currentChar);
            if (character > 'A' || character < 'Z'){
                decrpytedText = decrpytedText + (char) ((character - key.charAt(0) + 26) % 26 + 'A');
            }
        }

        //The decrypted text string is then outputted to be shown to the user.
        System.out.println("Decrypted Text: "+ decrpytedText);
    }
}
