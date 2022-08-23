public class exer2 {

    public static void main(String[] args){

        //The text that needs to be decrypted and the key to decrypt the text is entered.
        String textInFile = "NRSYZNLAIQCEHVZKXWPSXZSKKORXYA";
        String key = "TESSOFTHEDURBERVILLES";
        String decrpytedText = "";
        
        //A for loop goes through each character in the text and shifts the character by the current letter in the key. 
        //The program then goes onto the next character in the key word.
        for (int currentCharacter = 0, currentKeyCharacter = 0; currentCharacter < textInFile.length(); currentCharacter++){
            char character = textInFile.charAt(currentCharacter);
            if (character > 'A' || character < 'Z'){
                decrpytedText = decrpytedText + (char) ((character - key.charAt(currentKeyCharacter) + 26) % 26 + 'A');
                currentKeyCharacter = ++currentKeyCharacter % key.length();
            }
        }

        //The decrypted text is then outputted and shown to the user.
        System.out.println("The Decrypted Message: " + decrpytedText);
    }
}
