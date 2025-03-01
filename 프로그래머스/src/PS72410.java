import java.util.ArrayList;

public class PS72410 {
    public String solution(String new_id) {
        String answer = "";

        //1단계
        new_id = new_id.toLowerCase();

        //2단계
        String regularStr = "[^a-z0-9-_.]";
        new_id = new_id.replaceAll(regularStr, "");

        //3단계
        regularStr = "\\.{2,}";
        new_id = new_id.replaceAll(regularStr, ".");

        ArrayList<Character> charList = new ArrayList<>();

        for(int i=0; i<new_id.length(); i++) {
            charList.add(new_id.charAt(i));
        }

        //4단계
        if (charList.size() > 0) {
            if(charList.get(0) == '.' ) charList.remove(0);
            if(charList.size() > 0 && '.' == charList.get(charList.size()-1) )
                charList.remove(charList.size()-1);
        }

        //5단계
        if(charList.size() == 0) charList.add('a');

        for(Character i : charList) {
            answer += i;
        }

        if(answer.length() >= 16) {
            answer = answer.substring(0, 15);

            if(answer.charAt(answer.length()-1) == '.') {
                answer = answer.substring(0, answer.length() - 1);
            }
        }

        //7단계
        if(answer.length() <= 2) {
            while(answer.length() < 3) {
                answer += answer.substring(answer.length()-1);
            }
        }

        return answer;
    }
}
