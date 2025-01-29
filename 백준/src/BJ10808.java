import java.util.Scanner;

public class BJ10808 {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        String s = sc.next();
        int count = 0;
        char ch = 'a';

        for(int j = 0; j < 26; j++) {
            for (int i = 0; i < s.length(); i++) {
                if(s.charAt(i) == ch){
                    count++;
                }
            }
            System.out.print(count + " ");
            ch++;
            count = 0;
        }

    }
}
