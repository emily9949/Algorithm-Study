import java.util.HashMap;
import java.util.LinkedHashMap;

public class PS176963 {
    public int[] solution(String[] name, int[] yearning, String[][] photo) {
        int[] answer = new int[photo.length];

        HashMap<String,Integer> map = new LinkedHashMap<>();

        for(int i=0; i< name.length; i++){
            map.put(name[i], yearning[i]); // 추억하는 사람 이름에 점수 저장
        }

        for(int i=0; i< photo.length; i++){
            String[] persons = photo[i]; // 그룹별 배열 생성
            int score = 0;

            for(int j=0; j<persons.length; j++){

                String person = persons[j];
                if(map.containsKey(person)){ // map의 key에 photo 속 사람이 있다면
                    score+=map.get(person); // 점수 추가
                }
            }
            answer[i]=score;
        }
        return answer;
    }
}
