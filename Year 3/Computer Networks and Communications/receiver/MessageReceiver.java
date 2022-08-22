import java.util.Scanner;

/**
 * This class implements the receiver.
 * 
 */
public class MessageReceiver{
    private final int mtu; // maximum transfer unit (frame length limit)
    private final Scanner stdin;// Source of the frames.

    public MessageReceiver(int mtu){
        this.mtu = mtu;
        this.stdin = new Scanner(System.in);
    }

    public void receiveMessage(){
        boolean endOfMessage = false;
        String completeMessage = "";
        do {
            String completeFrame = stdin.nextLine();

            int start = 0;
            int nend = 0;

            for(int i = 0;i < completeFrame.length();i++){
                if(completeFrame.charAt(i) == '{'){
                    start = i;
                    break;
                }
            }

            for(int i = completeFrame.length()-1; i > 0;i--){
                if(completeFrame.charAt(i) == '}'){
                    if(completeFrame.charAt(i-1) == '?' || completeFrame.charAt(i-1) == ':'){
                        nend = i;
                        break;
                    }
                    else{
                        continue;
                    }
                }
            }
            if(nend == 0){
                System.err.println("Error: Incorrect frame format (No bracket at beginning or end of frame).");
                break;
            }

            String frame = completeFrame.substring(start, nend+1);
            
            int frameLength = frame.length();
            
            if(!(this.mtu > 8 && frameLength > 8)){
                System.err.println("Error: MTU Is Not Large Enough Or Frame Length Doesn't Have Minimal Requirements.");
                break;
            }
            else if(this.mtu < frameLength){
                System.err.println("Error: Incorrect Size For Frame.");
                break;
            }
            else if(start > nend){
                System.err.println("Error: Brackets Incorrect In Frame.");
                break;
            };

            String message = frame.substring(1, (frameLength-7));
            String hexValue = frame.substring((frameLength - 6), (frameLength - 3));
            String endFrame = frame.substring((frameLength - 2), (frameLength - 1));

            Character  bra1 = frame.charAt(0);
            Character  bra2 = frame.charAt(frameLength-1);

            String recalcHex= calculateHex(message);

            if(bra1.equals('{') && bra2.equals('}')){
                if(recalcHex.equals(hexValue)){
                    if(endFrame.equals(":")){
                        endOfMessage = true;
                        completeMessage += message;
                        System.out.println(completeMessage);
                    }
                    else if(endFrame.equals("?")){
                        if(stdin.hasNext()){
                            completeMessage += message;
                        }
                        else{
                            System.err.println("Error: No End (:) In Any Frames.");
                            break;
                        }
                    }
                    else{
                        System.err.println("Error: Incorrect End Token (: or ?).");
                        break;
                    }
                }
                else{
                    System.err.println("Error: Incorrect Hex Value.");
                    break;
                }
            }
            else{
                System.err.println("Error: Incorrect frame format (No bracket at beginning or end of frame).");
                break;
            }
        } while (!endOfMessage);
    }

    public String calculateHex(String message){
        int decSum=0;

        if(message.length() != 0){
            for(int i=0; i<message.length(); i++){
                decSum += message.charAt(i);
                
                if(message.charAt(i) == ';'){
                    i++;
                }
            }
        }

        String hexSum = Integer.toHexString(decSum);

        return formatHex(hexSum);
    }

    public String formatHex(String hexValue){

        if(hexValue == "0"){
            return "000";
        }
        if(hexValue.length() == 1){
            return ("00" + hexValue);
        }
        if(hexValue.length() == 2){
            return ("0" + hexValue);
        }
        if(hexValue.length() > 3){
            return (hexValue.substring(hexValue.length()-3));
        }
        else{
            return hexValue;
        }
    }
}