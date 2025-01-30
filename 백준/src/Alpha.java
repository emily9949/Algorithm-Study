import java.util.Scanner;

public class Alpha {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        //알파벳을 넣을 배열
        int[] arr = new int['z'-'a' + 1];

        //단어 입력받기
        String s = sc.nextLine();

        for (int i = 0; i < s.length(); i++) {
            int temp = s.charAt(i)-('a');
            arr[temp]++;
        }

        for (int i = 0; i < 'z'-'a' + 1; i++) {
            System.out.print(arr[i] + " ");
        }

        // 단어 s에 포함된 알파벳의 갯수를 각각 구한다.

    }
}
