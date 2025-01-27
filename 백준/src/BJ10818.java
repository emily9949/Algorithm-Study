import java.util.Arrays;
import java.util.Scanner;

public class BJ10818 {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        int N = sc.nextInt(); // N개의 정수
        int num = sc.nextInt();
        int max = num;  // max 와 min 변수 선언시 비교 가능한 값으로 초기화.
        int min = num; // num 으로 초기화 했지만 max = -1000000, min = 1000000 으로 설정하는 풀이법도 존재.

        for (int i = 1; i <= N-1; i++) {

            int temp = sc.nextInt();

            if (max <= temp)  max = temp;
            if (min >= temp)  min = temp;

        }

        System.out.print(min);
        System.out.print(" ");
        System.out.print(max);
    }
}
class Solution {
    public static void main(String[] args) {

        // 배열을 사용한 풀이법. 코드는 간단하나 시간은 더 오래걸림
        Scanner sc = new Scanner(System.in);
        int N = sc.nextInt();

        int[] arr = new int[N];

        for (int i = 0; i < N; i++) {
            arr[i] = sc.nextInt();
        }

        Arrays.sort(arr); // 정렬 함수 사용

        System.out.println(arr[0] + " " + arr[N - 1]);

    }
}



