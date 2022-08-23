public class exer5 {
    public static void main(final String[] args) {
        
        //The text that needs to be decrypted, the decrypted text field, the length of each column & 6 columns.
        String encrpyted ="OLTOESIMEFROPSTOTRWIOITEEYEAROSHHFOAETEMALHIYRTETITENMOITINDESFASWEFSABDTSTTWOEHFUSNWOHYSIRINYSNJSERATDWRCIEDOHORTSFSBSTOLFNRDSWGNVNHCEUETYNRATNRANEOALWOAHRHNNSNOHWRDFCYTTOETRSDUVOUTENEOYSHMHLEHRVHNEWRORLEHRJCLEBHOIIASTEALHOPNEBENEMATUDUSRHNHOEWATSAREFECTHAODHFARTIEUANDAOEEIPMMTDTRESIPGRFCONRKIEEYOSCNAHEIEUWHSKROESIRERTHYTSPFSYTEISEEAEGSAMFOEAEUUOMHEEFLOSSHMNLOTAAROXGWPTHRILETEDERAHMSENTPNTHAETTAETCEHNAMSAETWANGOAIHSIENTTASLHEVTAENATCFAEWTOADRRAEHNSBIINEREIAWHORAWOHHEWIDMOFSRETOASNSIUOELHFINIIAOCOUGSTESITEREERNYDHATRETIEWEEOAAOTTATHIAHESEGRMSNNIIVTHNNDECNSTOWSUOEFEERNGNHRTDPASMLPISYREEEEMONCEBFNAEFIROFAORHGXIOAAMNHMTOTHCLSAOIEZIMBTSIVLRSEAOSHREDIOGPOEDHMAHCIAMFNRTMHERAARIESHSALETTENTYSETDDLACAIHASMVROSMYOMDOOHCTSHHLRNOTEWWLMPNALREUTSEPELRHNMOONXDZTNFTEVANHOEDTRWSRATPLTTFEDOITDMTEEGBRUSAVISEINEHNKEFTTUAEOTLYYRPOIPNYRAARGSSWDHAAAP";
        String decryption = "";
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

        //This reorganises the entree of the decryption text. It takes the first character of each column and then goes onto
        //the next, adding each character until it's completed.
        for(int letterIndex = 0, coloumn = 0; letterIndex < lengths;coloumn++){
            if(coloumn == 6){
                coloumn = 0;
                letterIndex = letterIndex + 1;
            }
            else{
                char character = newText[coloumn].charAt(letterIndex);
                decryption = decryption + character;
            }
        }

        //The program then outputs the suggested decrypted text.
        System.out.println("Decrypted Text: "+ decryption);
    }
}
