import java.util.Arrays;
import java.util.Scanner;

public class BJ11656 {
    public static void main(String[] args) {

    Scanner sc = new Scanner(System.in);

    String s = sc.next();
    String[] strArr = new String [s.length()];

    // java.lang.String 클래스의 substring 함수 사용
    // 문자열의 i 부터 s.length 까지를 자른다
    for (int i = 0; i < s.length(); i++) {
        strArr[i] = s.substring(i, s.length());
    }

    /*  java.util.Arrays 클래스의 sort 함수 사용 (숫자, 문자 정렬 가능)
    *  문자열 정렬의 기본 원리 : 첫글자부터 유니코드 값 비교. 첫 글자가 같다면 두 번째 글자를 비교함
    *  정렬 기준을 변경하려면  Comparator를 사용하여 변경할 수 있음 */
    Arrays.sort(strArr);

    // for each 문으로 문자열 배열의 값을 str 에 저장함
    for(String str : strArr){
        System.out.print(str + " ");
    }

    }
}
