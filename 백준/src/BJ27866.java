import java.util.*;

public class BJ27866 {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        String s = sc.next();
        int n = sc.nextInt();

        // charAt 함수 : String으로 저장된 문자열 중에서 한 글자만 선택해서 변환해줌
        System.out.println(s.charAt(n-1));

        sc.close();
    }
}