import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.Collections;

public class BJ25305 {
    public static void main(String[] args) throws IOException {

        // BufferReader 를 활용한 풀이법
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        String[] input = br.readLine().split(" ");
        int N = Integer.parseInt(input[0]);  // 응시자의 수 N
        int K = Integer.parseInt(input[1]);  // 상을 받는 사람의 수 k
        Integer[] arr = new Integer[N]; // 학생의 점수를 저장할 배열

        String[] scores = br.readLine().split(" ");
        for (int i = 0; i < N; i++) {
            arr[i] = Integer.parseInt(scores[i]);
        }

        Arrays.sort(arr, Collections.reverseOrder()); // 내림차순 정렬

        System.out.println(arr[K-1]);
    }
}
