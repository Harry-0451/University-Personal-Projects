import java.util.Scanner;
import java.util.ArrayList;
/**
 * This class implements the sender.
 */
public class MessageSender
{
    // maximum transfer unit (frame length limit)
    private final int mtu;
    // Source of the messages.
    private final Scanner stdin;

    /**
     * Create and initialize a new MessageSender.
     *
     * @param mtu the maximum transfer unit (MTU) (the length of a frame must
     * not exceed the MTU)
     */
    public MessageSender(int mtu) {
        this.mtu = mtu;
        this.stdin = new Scanner(System.in);
    }

    /**
     * Read a line from standard input layer and break it into frames
     * that are output on standard output, one frame per line.
     * Report any errors on standard error.
     */
    public void sendMessage(){
        String message = stdin.nextLine();
        if(message != null){
            // This part needs completing.

            ArrayList<String> messageSeg = segmentMessage(message);
            ArrayList<String> messageFrames = new ArrayList<String>();

            for(int i = 0;i < messageSeg.size();i++){
                String check = checkSumFunc(messageSeg.get(i));

                if (i == (messageSeg.size() - 1)){
                    messageFrames.add(frameBuild(messageSeg.get(i),check,true));
                }
                else{
                    messageFrames.add(frameBuild(messageSeg.get(i),check,false));
                }
            }

            if(messageFrames.size() == 0){
                System.out.println("Error: Transfer Size Too Small");
            }

            for(int i = 0;i < messageFrames.size() ;i++){
                System.out.println(messageFrames.get(i));
            }
        }
        else {
            System.err.println("No message received.");
        }

    }

    public String addSemicolon(String mess){
        String message = "";

        for(int i = 0;i < mess.length() ;i++){
            message += mess.charAt(i);
            if(mess.charAt(i) == ';'){
                message += ';';
            }
        }

        return message;
    }

    public ArrayList<String> segmentMessage(String longMessage){
        ArrayList<String> msgParts = new ArrayList<String>();


        String modlongmessage = addSemicolon(longMessage);

        int msgTransfer = this.mtu - 8;
        int character = 0;

        if(msgTransfer < 1){
            return msgParts;
        }

        while (modlongmessage.length() > 0) {
            String thePart = "";
            while (character < msgTransfer && modlongmessage.length() > 0) { //Something wrong here, not that much remaining but message left i dunno lol

                if (character == (msgTransfer - 1)) {
                    if (modlongmessage.charAt(0) == ';' && modlongmessage.charAt(1) == ';'){
                        character = msgTransfer;
                        continue;
                    }
                }
                thePart += modlongmessage.charAt(0);
                modlongmessage = modlongmessage.substring(1);
                character += 1;
                
            }
            msgParts.add(thePart);
            character = 0;
        }

        if(modlongmessage == ""){
            msgParts.add("");
        }

        return msgParts;
    }





    public String frameBuild(String msgSeg, String checkSum, boolean msgEnd){
        char start = '{';
        char adjField = ';';
        char end = '}';
        String frame = "";

        if(msgEnd){
            return frame = start + msgSeg + adjField + checkSum + adjField + ':' + end;
        }
        else{
            return frame = start + msgSeg + adjField + checkSum + adjField + '?' + end;
        }
    }

    public String checkSumFunc(String checkMessage) {
            int decSum=0;
            String padHexSum = "";

            if(checkMessage.length() != 0){
                for(int i=0; i<checkMessage.length(); i++)
                {
                    decSum += checkMessage.charAt(i);
                    
                    if(checkMessage.charAt(i) == ';'){
                        i++;
                    }
                }
            }

            String hexSum = Integer.toHexString(decSum);

            if(hexSum == "0"){
                return "000";
            }
            if(hexSum.length() == 1){
                padHexSum = "00" + hexSum;
                return padHexSum;
            }
            if(hexSum.length() == 2){
                padHexSum = "0" + hexSum;
                return padHexSum;
            }
            if(hexSum.length() > 3){
                padHexSum = hexSum.substring(hexSum.length()-3);
                return padHexSum;
            }
            else{
                return hexSum;
            }
    }
}

