import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class BJ2857 {
    public static void main(String[] args) {
        String[] str = new String[5];

        Scanner sc = new Scanner(System.in);

        for (int i = 0; i < 5; i++) {
//            str = sc.nextLine().split("-") ;  split() 은 문자열 배열을 생성하기 때문에 str 에 계속 새로운 객체가 생성됨
            System.out.println(str[i]);
        }
    }
}
