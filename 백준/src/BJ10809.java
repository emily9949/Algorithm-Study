import java.util.Scanner;

public class BJ10809 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        String s = sc.next();

        // arr 배열의 모든 값을 -1로 초기화
        int[] arr = new int[26];
        for (int i = 0; i < 26; i++) {
            arr[i] = -1;
        }

        // arr 배열의 값은 String s의 인덱스 값
        for(int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);

            // 현재 문자의 인덱스를 계산
            if(arr[c - 'a'] == -1) {
                arr[c - 'a'] = i;
            }
        }

        for (int i = 0; i < 26; i++) {
            System.out.print(arr[i] + " ");
        }

        sc.close();

    }
}
