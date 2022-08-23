import java.util.*;

public class exer3 {
    public static void main(final String[] args) {

        //The text that needs to be decrypted and the key to decrypt the text is entered.
        String providedText = "IWUBZONEOYBJAJVLPNBUUKICQSBZFJWTCUFCMHIVYVNVIYPZLICAFDVWMWMXMVIYEZDULHXKMHMVZNOQNOQMMTLVGILJBYQZWVCAENQTYZMXWKJSQHWHYTQIPQXLXZDQNLPOPUGZQGDUMVZVKXYZFJNTLHIZZIUUAOPULYQNBUXVZOPUIHWXIHPLPXEEZMQMBMIVZOPUQHECAJUUPVVENOQMWDNOQNBEISMILJBBEVTBQLDZAEGLTJEIYHFZLQNATZQHYHEZBXYZFVOUIMYZVJUSOJUVIYFOWMBPOCBXYFTVLQLYUQMTUAFCQIBVGMEQMVZZEXYYQDVJBLUMAEOSEZFFUUPZLRYFAILJBLUMAACUEVVTMWDZITNOQDZFYYEJVQFPFDMIQHDHTONODJCWBATZZEITUIBXCZBMWSYZEOPUWOMHJULHZYQJMMGMVYNBDZOHYDYJZUUUPHWHYKUBVYZPQYIDXSGSCHCVGNBXYZTVEBBHZBQDAHFOPUQPZYWMNVAFCFIUUOAUFMFCMHCJTIMIMVROIFYZFMGJBLNMIIMOMILBYZAABXYJTZAJIMPMIMYYERMHYHEBWBXLZFVEWRQMAQHKFCMSUYHZLRYKBJAJMZQZUUXAACILYZAHMACUECQFQPFCBXYTMBVYZPOZVJJPXGIHMVRNWBITAIAJYTBGMCLZPPZRYFRDMBXOMQQDAXGDKAFFIVTAYKTDBXYYIVZTUMFZZFUYFDVWZYAHBUMZAKMDYKFCMVLVZOLEIYOMWIMLPOPUXVIIAJUPDNZEITICQSBDMNQDXLQKOBIVYVVTNOQICDZHEOMDYKFCMINHUMLEIYXD";
        String key ="";
        String decrpytedText = "";
        
        //This for loop creates "blocks" of strings that are 6 in length and adds it to an array followed by doing it again.
        //This happens until there are no more characters.
        int keyLen = 6;
        List<String> blocks = new ArrayList<>();
        for (int blockChar = 0; blockChar < providedText.length(); blockChar = blockChar + keyLen) {
            int endIndex = Math.min(blockChar + keyLen, providedText.length());
            String block = providedText.substring(blockChar, endIndex);
            blocks.add(block);
        }

        //This adds a character into each column.
        String[] newText = {"","","","","",""};
        for (String block : blocks) {
            for (int blockIndex = 0; blockIndex < block.length(); blockIndex++) {
                char c = block.charAt(blockIndex);
                newText[blockIndex] = newText[blockIndex] + c;
            }
        }

        //This for loop goes through every character and adds up the occurence of each letter.
        for(int CharNewText = 0; CharNewText < newText.length ;CharNewText++){
            int a1=0 ,b1=0 ,c1=0,d1=0,e1=0,f1=0,g1=0,h1=0,i1=0,j1=0,k1=0,l1=0,m1=0,n1=0,o1=0,p1=0,q1=0,r1=0,s1=0,t1=0,u1=0,v1=0,w1=0,x1=0,y1=0,z1=0;
            for(int occurence=0; occurence < newText[CharNewText].length() ;occurence++){
                switch(Character.toString(newText[CharNewText].charAt(occurence))){
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
            for(int letterIndex = 0; letterIndex < count.length ;letterIndex++){
                if(count[letterIndex] > count[max]){
                    max = letterIndex;
                }
            }

            //A standard alphabet in an array is created to corrolate with the counting array.
            String[] alphabet = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};

            //System.out.println("Group " + (i + 1) +" : "+ newText[i]);

            //This outputs the other most common characters to help choose the next characters to try.
            //for(int l = 0; l <= 25 ;l++){
            //    System.out.println(alphabet[l] + " " +count[l]);
            //}

            //System.out.println("Max Alphabet: "+ alphabet[max-4]);
            //System.out.println("Max Number: "+ max);

            //This is to make sure that the most common occurence - E isn't out of bounds and loops back to the other end of the array..
            if((max-4) < 0){
                if((max-3) < 0){
                    if((max-2) < 0){
                        if((max-1) < 0){
                            key = key + alphabet[22];
                        }
                        else{
                            key = key + alphabet[23];
                        }
                    }
                    else{
                        key = key + alphabet[24];
                    }
                }
                else{
                    key = key + alphabet[25];
                }
            }
            else{
                key = key + alphabet[max-4];
            }
            //System.out.println("Max is: "+ max);
        }

        //Outputs what the program believes to be the key. This may be wrong See -> Line 131 
        System.out.println("Suggested Key: "+ key);

        //This loop then shifts each character the needed number of times and adds it to the decrypted text string.
        for (int currentCharacter = 0, currentKeyCharacter = 0; currentCharacter < providedText.length(); currentCharacter++){
            char character = providedText.charAt(currentCharacter);
            if (character > 'A' || character < 'Z'){
                decrpytedText = decrpytedText + (char) ((character - key.charAt(currentKeyCharacter) + 26) % 26 + 'A');
                currentKeyCharacter = ++currentKeyCharacter % key.length();
            }
        }

        //The program then outputs the suggested decrypted text.
        System.out.println("Decrypted Text: "+ decrpytedText);

        //If any characters are incorrect in the key, it should be fairly obvious. From there we see the next common characters,
        //The next common characters are tried in exer2.java where I can control what the key is more readily.
    }
}
