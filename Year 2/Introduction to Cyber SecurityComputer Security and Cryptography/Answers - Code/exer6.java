import java.util.*;
public class exer6 {
    public static void main(final String[] args) {

        //The text that needs to be decrypted, the length of each column & 6 columns.
        String encrpyted ="FEGUYYUOREFEOAOSEPNATGCGSSRUTTAHEEISIHDRTIUATNTLNOTLITROEOVYNWSWHEGEDEHGRTKAIHKAEOOPGEPVGTWTWUHIBOATFGOIHLODYETUEATUNKRNVGOIOVLGLREYYLNTWUNNRIOYEEOUFESISOYCUNOONMOONEASEGOAUNAHINUYIRLENLASHLOIQHSEEUHRINNLEMANAUYAEOOWIMOHANGNIAHHOHIBIARFLITHVAKAUGTVEYFYOWBYKETTHBOOERNANSSSRSSRHYOBONIAOOTNGOONEPTEREORHOAISUOEIASEDMNDTEEOOBGSUDLAHNISTSIHRNEHOEIHEDELOAAHIDNTSEHDBPNRTYPEHJIOHNYSENTIEEWTTTUMVLIDONHLDSISIUVLUELELACOOFOHCOHDEVROLSBDOMSVDTTAWENUOYWRETGQSINTSTTINTDBNRARAASAIDNLUAHDMPACDSDYSPNGTMTUCUUHSEOEVHLGNKAAUATETNTELDHAENNTGEYEMSIOVCEOAAFEAELUYEANAGBEEEKEOOWAAGFEGYDOTVEGSNLEOOSYARHFEEHERIIHAOLTFOSLEOETNAHAGLDKETEKVYEEDAAKTUPAHOBLHDYWHOHSHENIYMUIHWYLOTOIAFTWATIHONAOMRIILOTTOPIHEGTYVOIHIIEUARAONNYSURIVNUUYOITRESPHYERWEEDNVMCTPDTTPCPGEINNKHLHURGYUETTMEHEACMMETRCIJULWYNTSEOOTTSIIEIGAOOYTTOLDAWWHIOSHLLTHAHLEEFSOHIAOSOGMNNEOFRCSDCAUUIMEAMU";
        int lengths = encrpyted.length()/6;
        String[] newText = {"","","","","",""};

        //This takes each character in the string and adds it to a new column, if the length is too high then it moves onto
        //the next column.
        for(int letter = 0,coloumnNewText=0; letter < encrpyted.length();letter++){
            char character = encrpyted.charAt(letter);
            newText[coloumnNewText] = newText[coloumnNewText] + character;
            if(newText[coloumnNewText].length() >= lengths){
                coloumnNewText = coloumnNewText +1 ;
            }
        }

        //This creates the different ordered columns to be tried in the next for loop.
        int[][] colRow = {{5,4,1,3,0,2},{0,1,2,3,4,5}};

        //This reorganises the entree of the decryption text. It takes the first character of each column and then goes onto
        //the next, adding each character until it's completed. This will access the column order from colRow in order to achieve
        //the required decryption.
        for(int attempt=0 ; attempt< colRow.length ;attempt++){
            String decryption = "";
            for(int letterIndex = 0, coloumn = 0; letterIndex < lengths;coloumn++){
                if(coloumn == 6){
                    coloumn = 0;
                    letterIndex = letterIndex + 1;
                }
                else{
                    char character = newText[colRow[attempt][coloumn]].charAt(letterIndex);
                    decryption = decryption + character;
                }
            }

            //This outputs the order of columns used followed by the decryption this creates.
            System.out.println("Column: "+ Arrays.toString(colRow[attempt]));
            System.out.println("Decryption: "+ decryption);

            //This process could take a while. I personally loaded the colRow with multiple different possibilities
            //and tried different orders until words were beginning to form more easily. But I left two in there, the 
            //actual key needed to decrypt the text & the first key I used. As well as to provide an idea as to how this 
            //program works. As a side note: This program could be improved by including another feature that loops through
            //the decrpyred text to find any common words forming. For example: "AN","TH","BY","SA". To help show what keys are
            //correct / can be kept to reduce time.
        }
    }
}