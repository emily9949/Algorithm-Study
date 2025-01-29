import java.util.Scanner;

public class BJ11721 {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        String s = sc.next();

        // index 를 0-9 씩 끊어서 출력.
        for(int i = 0; i < s.length(); i++) {
            System.out.print(s.charAt(i));
            if(i % 10 == 9) {
                System.out.println();
            }
        }
    }
}
