import java.util.Scanner;

public class BJ2744 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String s = sc.nextLine();

        char[] charr = s.toCharArray();  // java.lang.String 의 toCharArray 함수 사용

        for (int i = 0; i < charr.length; i++) {
            if (charr[i] >= 'A' && charr[i] <= 'Z') {
                charr[i] = (char) (charr[i] + 32); // 산술 연산 시 자동 형변환이 되기 때문에 다시 강제 형변환을 해주어야함
            } else if (charr[i] >= 'a' && charr[i] <= 'z') {
                charr[i] = (char) (charr[i] - 32); // A : 65, Z: 90, a : 97
            }
        }

        for (int i = 0; i < charr.length; i++) {
            System.out.print(charr[i]);
        }

    }
}
