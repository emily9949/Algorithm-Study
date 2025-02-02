import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Stack;

public class BJ9012 {
    public static void main(String[] args) throws IOException {

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        Stack<Character> Stack = new Stack<>();

        int T = Integer.parseInt(br.readLine()); // 테스트케이스 수

        for (int i = 0; i < T; i++) {
            String st = br.readLine();
            boolean flag = true;

            for (char ch : st.toCharArray()) {
                if (ch == '(') {
                    Stack.push(ch);
                } else if (ch == ')') {
                    if (Stack.isEmpty()) { // 닫는 괄호가 먼저 나오는 경우
                        flag = false;
                        break; // 비었으면 즉시 for 문 종료
                    }
                    Stack.pop(); // 스택이 남아있으면 '(' 와 ')'의 짝을 pop()
                }
            }

            if (!Stack.isEmpty()) { // 스택에 아직 괄호가 남아있을 경우
                flag = false;
            }

            System.out.println(flag ? "YES" : "NO");
            Stack.clear();

        }
    }
}
